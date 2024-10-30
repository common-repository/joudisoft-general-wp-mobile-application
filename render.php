<?php
if( !defined('JSOFT_AWP_PLUGIN_PATH') ) die('You are not allowed to access this page directly');

function jsoft_awp_render_output(){
  GLOBAL $jsoft_awp;

  if(!empty($jsoft_awp['sets']) && !empty($jsoft_awp['sets']['options'])
  && !empty($jsoft_awp['sets']['options']['rest_api_url'])) {
      if($jsoft_awp['sets']['options']['rest_api_url'] !== $jsoft_awp['plugin']['rest_api_url']
      || $jsoft_awp['sets']['options']['wp_rest_api_url'] !== $jsoft_awp['plugin']['wp_rest_api_url']
      || $jsoft_awp['sets']['options']['website_url'] !== $jsoft_awp['plugin']['blog_url']) {
          update_option('jsoft-awp-api-check',0);
          return jsoft_awp_render_plugin_changed();
        }
  }

  $jsoft_awp['api_check_time'] = get_option('jsoft-awp-api-check');
  if(empty($jsoft_awp['api_check_time']) || !is_numeric($jsoft_awp['api_check_time'])
  || time() - round($jsoft_awp['api_check_time']) >= 600) {
    $apiRoute_op = jsoft_awp_http_fetch_remote_data($jsoft_awp['plugin']['rest_api_url'].'/jsoft_awp/check');
    $apiRoute_op = (!empty($apiRoute_op) && jsoft_awp_do_check_json($apiRoute_op))? json_decode($apiRoute_op,true) : NULL;
    if(empty($apiRoute_op) || !is_array($apiRoute_op)
    || empty($apiRoute_op['type']) || $apiRoute_op['type'] !== "success")
          return jsoft_awp_render_no_api();
    $jsoft_awp['api_check_time'] = time();
    update_option('jsoft-awp-api-check',$jsoft_awp['api_check_time']);
  }


  $jsoft_awp['vtoken'] = get_option('jsoft-awp-vtoken');
  if(!empty($jsoft_awp['vtoken'])) {
      delete_option('jsoft-awp-vtoken');
      $doRender = jsoft_awp_draw_template($jsoft_awp['vtoken']);
      if($doRender !== false) {
          echo $doRender;
          return null;
      }
  }
  if(empty($jsoft_awp['sets'])) return jsoft_awp_render_no_sets();
  return jsoft_awp_render_application();
}

function jsoft_awp_render_no_api() {
  GLOBAL $jsoft_awp;
  echo jsoft_awp_draw_template('no_api.tpl');
  return null;
}

function jsoft_awp_render_plugin_changed() {
  GLOBAL $jsoft_awp;
  $ab_operation = (empty($_REQUEST['ab_operation']) || !is_string($_REQUEST['ab_operation']))? false : $_REQUEST['ab_operation'];
  switch($ab_operation) {
    case 'full_reset':
      delete_option('jsoft-awp-sets');
      echo jsoft_awp_draw_template('refresh.tpl');
      return null;
    break;
  }
  echo jsoft_awp_draw_template('plugin_changed.tpl');
  return null;
}

function jsoft_awp_render_no_sets() {
  GLOBAL $jsoft_awp;
  $renderData = [];
  $ab_operation = (empty($_REQUEST['ab_operation']) || !is_string($_REQUEST['ab_operation']))? false : $_REQUEST['ab_operation'];
  switch($ab_operation) {
    case 'application_create':

      $checkToken = md5(time().rand(100,1000));
      update_option('jsoft-awp-ctoken',$checkToken);

      $postData = [
        'a' => 'application',
        'b' => 'create',
        'blog_name' => get_option('blogname'),
        'blog_domain' => $jsoft_awp['plugin']['blog_domain'],
        'blog_url' => $jsoft_awp['plugin']['blog_url'],
        'server_ip' => !empty(jsoft_awp_do_getserv('SERVER_ADDR'))? jsoft_awp_do_getserv('SERVER_ADDR') : jsoft_awp_do_getserv('LOCAL_ADDR'),
        'rest_api_url' => $jsoft_awp['plugin']['rest_api_url'],
        'wp_rest_api_url' => $jsoft_awp['plugin']['wp_rest_api_url'],
        'wp_rest_check_token' => $checkToken,
      ];

	    $accessData = jsoft_awp_do_filter_array($postData,['blog_name','blog_domain','blog_url','server_ip','rest_api_url','wp_rest_api_url','wp_rest_check_token']);
      $postResponse = jsoft_awp_do_router_post($postData,$accessData);

      $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
      if(empty($postResponse) || !is_array($postResponse) || empty($postResponse['type'])) {
        jsoft_awp_do_add_notice("API Failure, something went wrong while trying to create the application.. Please try again later","danger");
        break;
      }

      if(jsoft_awp_check_response_exception($postResponse))
            $jsoft_awp['sets'] = jsoft_awp_update_sets_exception(jsoft_awp_default_sets(),$postResponse);

      if(!jsoft_awp_check_response_success($postResponse)) {
        jsoft_awp_do_add_notice($postResponse['msg'],$postResponse['type']);
        break;
      }

      echo jsoft_awp_draw_template('application_created.tpl',$renderData);
      return null;
    break;
    case 'application_transfer':
        if(!class_exists('jsoft_awp_validator')) require_once(JSOFT_AWP_PLUGIN_PATH . "/classes/jsoft_awp_validator.class.php");

        $checkToken = md5(time().rand(100,1000));
        update_option('jsoft-awp-ctoken',$checkToken);

        $v = new jsoft_awp_validator($_POST);

        $fields = ['transfer_method','transfer_key'];
        $required = ['transfer_method'];

        $v->rule('in', "transfer_method", ['transfer_key','no_transfer_key']);
        if(!empty($_POST['transfer_method']) && is_string($_POST['transfer_method'])
        && $_POST['transfer_method'] == 'transfer_key') {
          array_push($required,'transfer_key');
          $v->rule('length', "transfer_key", 32);
          $v->rule('alphaNum', "transfer_key");
        }
        $v->rule('required', $required);

        $validate = jsoft_awp_do_validate_v($v);
        if($validate !== true) {
          jsoft_awp_do_add_notice($validate,'danger');
          break;
        }

        $postData = jsoft_awp_do_filter_array($_POST,$fields);
        $postData = array_map('jsoft_awp_render_smart_escape',$postData);

    		$postData = array_merge($postData,[
              'a' => 'application',
              'b' => 'transfer',
              'blog_name' => get_option('blogname'),
              'blog_domain' => $jsoft_awp['plugin']['blog_domain'],
              'blog_url' => $jsoft_awp['plugin']['blog_url'],
              'server_ip' => !empty(jsoft_awp_do_getserv('SERVER_ADDR'))? jsoft_awp_do_getserv('SERVER_ADDR') : jsoft_awp_do_getserv('LOCAL_ADDR'),
              'rest_api_url' => $jsoft_awp['plugin']['rest_api_url'],
              'wp_rest_api_url' => $jsoft_awp['plugin']['wp_rest_api_url'],
              'wp_rest_check_token' => $checkToken,
        ]);

        $accessData = jsoft_awp_do_filter_array($postData,['blog_name','blog_domain','blog_url','server_ip','rest_api_url','wp_rest_api_url','wp_rest_check_token']);
        $postResponse = jsoft_awp_do_router_post($postData,$accessData);

        $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
        if(empty($postResponse) || !is_array($postResponse) || empty($postResponse['type'])) {
          jsoft_awp_do_add_notice("API Failure, something went wrong while trying to transfer the application.. Please try again later","danger");
          break;
        }

        if(jsoft_awp_check_response_exception($postResponse))
              $jsoft_awp['sets'] = jsoft_awp_update_sets_exception(jsoft_awp_default_sets(),$postResponse);

        if(!jsoft_awp_check_response_success($postResponse)) {
          jsoft_awp_do_add_notice($postResponse['msg'],$postResponse['type']);
          break;
        }

        echo jsoft_awp_draw_template('application_transferred.tpl',$renderData);
        return null;
    break;
  }
  echo jsoft_awp_draw_template('no_application.tpl',$renderData);
  return null;
}

function jsoft_awp_render_application() {
  GLOBAL $jsoft_awp;
  $renderData = [];

  $renderData['blog'] = jsoft_awp_get_bloginfo(true);
  include( JSOFT_AWP_PLUGIN_PATH . '/ionic.php' );
  $renderData['ionic'] = !empty($ionic)? $ionic : false;
  include( JSOFT_AWP_PLUGIN_PATH . '/notifyicons.php' );
  $renderData['notifyicons'] = !empty($josft_awp_notifyicons)? $josft_awp_notifyicons : false;

  $ab_operation = (empty($_REQUEST['ab_operation']) || !is_string($_REQUEST['ab_operation']))? false : $_REQUEST['ab_operation'];
  switch($ab_operation) {
    case 'set_options':

    	 $fields = ["language","home_page_id","page_direction","posts_template","max_excerpt_length","excerpt_class","home_slider","category_slider","enable_comments","website_url","contact_email","contact_cc","general_color","statusbar_color","brand_title_color","post_headline_color","post_title_color","page_title_color","brand_title_decoration","post_headline_decoration","post_title_decoration","page_title_decoration","home_title","posts_title","categories_title","bookmarks_title","settings_title","visit_website_title","search_title","custom_menu_pages","custom_menu_position","application_menu_brand_type","application_menu_logo","social_menu_position","social_facebook_link","social_twitter_link","social_instagram_link","application_menu_title","application_menu_slogan","google_admob_pub_id","google_admob_unit_id","google_admob_position","google_admob_size"];

        $postData = jsoft_awp_do_filter_array($_REQUEST,$fields);
        $postData = array_merge($postData,['a' => 'options','b' => 'set', 'check_fp' => mt_rand(100,1000)]);

        $postData = array_map('jsoft_awp_render_smart_escape',$postData);

        if(!empty($postData['general_color'])) $postData['general_color'] = array_search($postData['general_color'], $renderData['ionic']['colors']);
        if(empty($postData['general_color'])) $postData['general_color'] = $jsoft_awp['sets']['options']['general_color'];

        $postData['custom_menu_pages'] = "";
        if(!empty($_REQUEST['custom_menu_titles']) && !empty($_REQUEST['custom_menu_items'])) {
            foreach($_REQUEST['custom_menu_titles'] as $key => $value) {
              if(empty($value) || empty($_REQUEST['custom_menu_items'][$key])) continue;
              if(!empty($_REQUEST['custom_menu_icons'][$key])) $value .= "*I_C_O*".$_REQUEST['custom_menu_icons'][$key];
              $postData['custom_menu_pages'] .= "$value::".$_REQUEST['custom_menu_items'][$key].'***';
            }
            $postData['custom_menu_pages'] = !empty($postData['custom_menu_pages'])? rtrim($postData['custom_menu_pages'],'***') : NULL;
        }

        $postResponse = jsoft_awp_do_application_post($postData);
        $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
        if(empty($postResponse) || !is_array($postResponse) || empty($postResponse['type'])) {
          jsoft_awp_do_add_notice("API Failure, something went wrong while trying to update application options","danger");
          break;
        }

        if(jsoft_awp_check_response_exception($postResponse)) {
            if(!empty($postResponse['exception']['_no_service'])) {
              $customOutputFile = 'no_service.tpl';
              unset($postResponse['exception']['_no_service']);
              break;
            }
            if(!empty($postResponse['exception']['_no_app'])) {
              delete_option('jsoft-awp-sets');
              $customOutputFile = 'refresh.tpl';
              unset($postResponse['exception']['_no_app']);
              break;
            } else {
              if(!empty($postResponse['exception']))
                $jsoft_awp['sets'] = jsoft_awp_update_sets_exception($jsoft_awp['sets'],$postResponse);
            }
        }

        jsoft_awp_do_add_notice($postResponse['msg'],$postResponse['type']);
    break;
    case 'send_notification':
        if(!empty($jsoft_awp['sets']['application']['is_build'])) {
            jsoft_awp_do_add_notice("Application is in building status, please allow some time to perform such operation",'danger');
            break;
        }

        $fields = ["title","text","icon","smallIcon","color","interaction","interaction_ref"];
        $required = ["title","text","icon","smallIcon"];

		foreach($fields as $key) {
			if(empty($_REQUEST[$key])) continue;
			if(!is_string($_REQUEST[$key]) && !is_numeric($_REQUEST[$key])) {
				unset($_REQUEST[$key]);
				continue;
			}
		}

        if(!class_exists('jsoft_awp_validator')) require_once(JSOFT_AWP_PLUGIN_PATH . "/classes/jsoft_awp_validator.class.php");

        $v = new jsoft_awp_validator($_REQUEST);
        $v->rule('required', $required);
        $v->rule('lengthBetween', "title", 1, 128);
        $v->rule('lengthBetween', "text", 1, 254);
        $v->rule('lengthBetween', "icon", 1, 254);
        $v->rule('lengthBetween', "smallIcon", 1, 254);

		if(!empty($_REQUEST['interaction']))
			$v->rule('lengthBetween', "interaction", 1, 128);
		if(!empty($_REQUEST['interaction_ref']))
			$v->rule('lengthBetween', "interaction_ref", 1, 1000);
		if(!empty($_REQUEST['color']))
			$v->rule('lengthBetween', "color", 1, 24);

        $validate = jsoft_awp_do_validate_v($v);
        if($validate !== true) {
          jsoft_awp_do_add_notice($validate,'danger');
          break;
        }
        $postData = jsoft_awp_do_filter_array($_REQUEST,$fields);
        $postData = array_merge($postData,['a' => 'notifications','b' => 'register']);
        $postData = array_map('jsoft_awp_render_smart_escape',$postData);

        if(!isset($renderData['notifyicons']['notification_icons'][$postData['icon']])) {
          jsoft_awp_do_add_notice('Undefined notification icon','danger');
          break;
        }

        if(!isset($renderData['notifyicons']['notification_small_icons'][$postData['smallIcon']])) {
          jsoft_awp_do_add_notice('Undefined notification small icon','danger');
          break;
        }

        $postResponse = jsoft_awp_do_application_post($postData);
        $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
        if(empty($postResponse) || !is_array($postResponse) || empty($postResponse['type'])) {
          jsoft_awp_do_add_notice("API Failure, something went wrong while trying to send notification","danger");
          break;
        }

        if(jsoft_awp_check_response_exception($postResponse)) {
            if(!empty($postResponse['exception']['_no_service'])) {
              $customOutputFile = 'no_service.tpl';
              unset($postResponse['exception']['_no_service']);
              break;
            }
            if(!empty($postResponse['exception']['_no_app'])) {
              delete_option('jsoft-awp-sets');
              $customOutputFile = 'refresh.tpl';
              unset($postResponse['exception']['_no_app']);
              break;
            } else {
              if(!empty($postResponse['exception']))
                $jsoft_awp['sets'] = jsoft_awp_update_sets_exception($jsoft_awp['sets'],$postResponse);
            }
        }

        jsoft_awp_do_add_notice($postResponse['msg'],$postResponse['type']);

    break;
    case 'build_app':
        if(!empty($jsoft_awp['sets']['application']['is_build'])) {
            jsoft_awp_do_add_notice("Application is in building status, please allow some time to perform such operation",'danger');
            break;
        }

        $fields = ['title','description','package_name','author','version','icon','splash_portrait','splash_landscape'];


        if(!class_exists('jsoft_awp_validator')) require_once(JSOFT_AWP_PLUGIN_PATH . "/classes/jsoft_awp_validator.class.php");

        $v = new jsoft_awp_validator($_REQUEST);
        $v->rule('required',$fields);
        $v->rule('lengthMax', "title", 128);
        $v->rule('lengthBetween', "package_name", 5, 45);
        $v->rule('regex', "description", "/^[a-z\d\-_.\s]+$/i");
        $v->rule('lengthMax', "description", 254);
        $v->rule('lengthMax', "package_name", 50);
        $v->rule('regex', "package_name", "/^[a-z][a-z0-9_]*(\.[a-z0-9_]+)+[0-9a-z_]$/");
        $v->rule('lengthMax', "author", 128);
        $v->rule('regex', "author", "/^[a-z\d\-_.\s]+$/i");
        $v->rule('urlActive', ['icon','splash_portrait','splash_landscape']);
        $v->rule('lengthBetween', "version", 1, 10);
        $v->rule('regex', "version", "/^\d+(\.\d+)*$/");

        $validate = jsoft_awp_do_validate_v($v);
        if($validate !== true) {
          jsoft_awp_do_add_notice($validate,'danger');
          break;
        }
        $postData = jsoft_awp_do_filter_array($_REQUEST,$fields);
        $postData = array_merge($postData,['a' => 'package','b' => 'save']);
        $postData = array_map('jsoft_awp_render_smart_escape',$postData);

        foreach(["for","is","equal","or","xor","int","val","remove","add","final","update","delete","trim","eval","class","function","string","array","float","var","first","end"] as $key => $value) {
          if(strpos($packageData['package_name'],$value) === false
          || (strpos($packageData['package_name'],"$value.") === false
          && strpos($packageData['package_name'],".$value") === false)) continue;
          if(strpos($packageData['package_name'],".$value.") !== false
          || strpos($packageData['package_name'],"$value.") === 0
          || strpos($packageData['package_name'],".$value") === strlen($packageData['package_name']) - (strlen($value) + 1)) {
            jsoft_awp_do_add_notice("Package name contains prohibited word $value",'danger');
            break;
          }
        }

        $postResponse = jsoft_awp_do_application_post($postData);
        $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
        if(empty($postResponse) || !is_array($postResponse) || empty($postResponse['type'])) {
          jsoft_awp_do_add_notice("API Failure, something went wrong while trying to build package","danger");
          break;
        }

        if(jsoft_awp_check_response_exception($postResponse)) {
            if(!empty($postResponse['exception']['_no_service'])) {
              $customOutputFile = 'no_service.tpl';
              unset($postResponse['exception']['_no_service']);
              break;
            }
            if(!empty($postResponse['exception']['_no_app'])) {
              delete_option('jsoft-awp-sets');
              $customOutputFile = 'refresh.tpl';
              unset($postResponse['exception']['_no_app']);
              break;
            } else {
              if(!empty($postResponse['exception']))
                $jsoft_awp['sets'] = jsoft_awp_update_sets_exception($jsoft_awp['sets'],$postResponse);
            }
        }

        jsoft_awp_do_add_notice($postResponse['msg'],$postResponse['type']);

        if(!jsoft_awp_check_response_success($postResponse)) break;

        $postResponse = jsoft_awp_do_application_post(['a' => 'package', 'b' => 'build']);
        $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
        if(empty($postResponse) || !is_array($postResponse) || empty($postResponse['type'])) {
          jsoft_awp_do_add_notice("Build command API failure","danger");
          break;
        }

        if(jsoft_awp_check_response_exception($postResponse)) {
            if(!empty($postResponse['exception']['_no_service'])) {
              $customOutputFile = 'no_service.tpl';
              unset($postResponse['exception']['_no_service']);
              break;
            }
            if(!empty($postResponse['exception']['_no_app'])) {
              delete_option('jsoft-awp-sets');
              $customOutputFile = 'refresh.tpl';
              unset($postResponse['exception']['_no_app']);
              break;
            } else {
              if(!empty($postResponse['exception']))
                $jsoft_awp['sets'] = jsoft_awp_update_sets_exception($jsoft_awp['sets'],$postResponse);
            }
        }

        jsoft_awp_do_add_notice($postResponse['msg'],$postResponse['type']);

        if(!jsoft_awp_check_response_success($postResponse)) break;
    break;
    case 'update_license':
        if(!empty($jsoft_awp['sets']['application']['is_build'])) {
            jsoft_awp_do_add_notice("Application is in building status, please allow some time to perform such operation",'danger');
            break;
        }

        $fields = ["license_key"];

        if(!class_exists('jsoft_awp_validator')) require_once(JSOFT_AWP_PLUGIN_PATH . "/classes/jsoft_awp_validator.class.php");

        $v = new jsoft_awp_validator($_REQUEST);
        $v->rule('required', "license_key");
		$v->rule('regex', "license_key", "/^[0-9A-Za-z]{1,20}$/");

        $validate = jsoft_awp_do_validate_v($v);
        if($validate !== true) {
          jsoft_awp_do_add_notice($validate,'danger');
          break;
        }
        $postData = jsoft_awp_do_filter_array($_REQUEST,$fields);
        $postData = array_merge($postData,['a' => 'license','b' => 'update']);
        $postData = array_map('jsoft_awp_render_smart_escape',$postData);

        $postResponse = jsoft_awp_do_application_post($postData);
        $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
        if(empty($postResponse) || !is_array($postResponse) || empty($postResponse['type'])) {
          jsoft_awp_do_add_notice("API Failure, something went wrong while trying to update license","danger");
          break;
        }

        if(jsoft_awp_check_response_exception($postResponse)) {
            if(!empty($postResponse['exception']['_no_service'])) {
              $customOutputFile = 'no_service.tpl';
              unset($postResponse['exception']['_no_service']);
              break;
            }
            if(!empty($postResponse['exception']['_no_app'])) {
              delete_option('jsoft-awp-sets');
              $customOutputFile = 'refresh.tpl';
              unset($postResponse['exception']['_no_app']);
              break;
            } else {
              if(!empty($postResponse['exception']))
                $jsoft_awp['sets'] = jsoft_awp_update_sets_exception($jsoft_awp['sets'],$postResponse);
            }
        }

        if(!jsoft_awp_check_response_success($postResponse)) {
          jsoft_awp_do_add_notice($postResponse['msg'],$postResponse['type']);
          break;
        }

        jsoft_awp_do_add_notice('License has been updated successfully','success');

    break;
  }

  $customOutputFile = false;
  $requestIdleRime = 300;

  if(empty($jsoft_awp['sets']['application']['is_active'])) {
    $requestIdleRime = 3600;
    $customOutputFile = 'app_inactive.tpl';
  } elseif(!empty($jsoft_awp['sets']['application']['is_build'])) {
    $requestIdleRime = 60;
    $customOutputFile = 'build_running.tpl';
  }

  if(empty($jsoft_awp['sets']['request_time']) || !is_numeric($jsoft_awp['sets']['request_time'])
  || time() - round($jsoft_awp['sets']['request_time']) >= $requestIdleRime) {
      $postResponse = jsoft_awp_do_application_post(['a' => 'options', 'b' => 'get']);
      $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
      if(jsoft_awp_check_response_exception($postResponse)) {
          $resetTimer = true;
          if(!empty($postResponse['exception']['_no_service'])) {
            $customOutputFile = 'no_service.tpl';
            $resetTimer = false;
            unset($postResponse['exception']['_no_service']);
          }
          if(!empty($postResponse['exception']['_no_app'])) {
            delete_option('jsoft-awp-sets');
            $customOutputFile = 'refresh.tpl';
            unset($postResponse['exception']['_no_app']);
          } else {
            if(!empty($postResponse['exception']))
              $jsoft_awp['sets'] = jsoft_awp_update_sets_exception($jsoft_awp['sets'],$postResponse,$resetTimer);
          }
      }
  }

  if(!empty($customOutputFile)) {
    echo jsoft_awp_draw_template($customOutputFile);
    return null;
  }

  if(!empty($jsoft_awp['sets']['options'])) {
    $renderData['custom_menu'] = [];
    if(!empty($jsoft_awp['sets']['options']['custom_menu_pages'])) {
      $doExplodeMenu = explode("***",$jsoft_awp['sets']['options']['custom_menu_pages']);
      if(!empty($doExplodeMenu)) foreach($doExplodeMenu as $key => $menuItem) {
        if(strpos($menuItem,"::") === false) continue;
          $doExplodeItem = preg_split('~::(?=[^::]*$)~', $menuItem);
          if(empty($doExplodeItem[1]) || !is_numeric($doExplodeItem[1]) || intval($doExplodeItem[1]) <= 0) continue;
          $doExplodeItemIcon = explode("*I_C_O*",$doExplodeItem[0]);
          $renderData['custom_menu'][] = [
            "menu_item_id" => intval($doExplodeItem[1]),
            "menu_item_title" => $doExplodeItemIcon[0],
            "menu_item_icon" => !empty($doExplodeItemIcon[1])? $doExplodeItemIcon[1] : null,
          ];
      }
    }
    if(empty($renderData['custom_menu'])) $renderData['custom_menu'] = false;
    if(!empty($jsoft_awp['sets']['options']['general_color']))
      $renderData['general_color_ref'] = !empty($ionic['colors'][$jsoft_awp['sets']['options']['general_color']])?
                                      $ionic['colors'][$jsoft_awp['sets']['options']['general_color']] : '';
  }

  echo jsoft_awp_draw_template('application.tpl',$renderData);
  return null;
}
