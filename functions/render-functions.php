<?php
if( !defined('JSOFT_AWP_PLUGIN_DIR_URL') ) die('You are not allowed to access this page directly');

function jsoft_awp_do_get_redirect_url($queries = NULL,$page = "appbox-wordpress-general") {
	if(empty($page)) return false;
	$pageURL = menu_page_url($page,false);
	if(empty($pageURL)) return false;
	if(empty($queries) || !is_array($queries)) return $pageURL;

	$parsedURL = parse_url($pageURL);
	if(empty($parsedURL)) return false;
	$parsedURL['query'] = ['page' => $page];
	if(!empty($queries) && is_array($queries))
		$parsedURL['query'] = array_merge($parsedURL['query'],$queries);
	$parsedURL['query'] = http_build_query($parsedURL['query']);
	if(function_exists('http_build_url')) return http_build_url($parsedURL);
	if(!function_exists('jsoft_awp_http_build_url'))
		require_once( JSOFT_AWP_PLUGIN_PATH . '/functions/on-demand/jsoft_awp_http_build_url.php' );
	return jsoft_awp_http_build_url($parsedURL);	
}

function jsoft_awp_do_add_notice($message = null,$type = "danger") {
	GLOBAL $jsoft_awp_notices;
	if($type == "error") $type == "danger";
	if(!$message) $message = 'Something went wrong';
	array_push($jsoft_awp_notices,array("text" => $message,"type" => $type));
	return true;
}

function jsoft_awp_get_blog_pages() {
  $pageIDs = get_all_page_ids();
  if(empty($pageIDs)) return false;
  $dataR = array();
  foreach($pageIDs as $pid) {
		if(!get_post_status($pid) || in_array(strtolower(get_post_status($pid)),array('draft','auto-draft','pending','inherit','inherit','trash'))) continue;
    $dataR[] = array("id" => $pid, "title" => get_the_title($pid));
  }
  return $dataR;
}

function jsoft_awp_get_bloginfo($include_pages = true) {
  $dataR = array(
    "name" => get_option('blogname'),
    "description" => get_option('blogdescription'),
    "url" => get_site_url(),
    "pages" => $include_pages? jsoft_awp_get_blog_pages() : false,
  );
  return $dataR;
}

function jsoft_awp_draw_template($template_file,$renderData = false) {
	if(!is_file(JSOFT_AWP_PLUGIN_PATH . "/template/$template_file")) return false;
	global $jsoft_awp, $jsoft_awp_notices;
  if(empty($jsoft_awp_notices)) $jsoft_awp_notices = false;
	require_once( JSOFT_AWP_PLUGIN_PATH . '/classes/jsoft_awp_div.class.php' );
	return new jsoft_awp_div( JSOFT_AWP_PLUGIN_PATH . "/template/$template_file" ,
    array (
          'AWP' => $jsoft_awp,
          'NOTICES' => $jsoft_awp_notices,
          'DATA' => $renderData
        )
  );
}
