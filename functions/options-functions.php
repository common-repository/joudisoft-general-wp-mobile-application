<?php
function jsoft_awp_check_sets() {
  GLOBAL $jsoft_awp;
  $sets = $jsoft_awp['sets'];
  if(empty($sets) || !is_array($sets)) return false;
  if(empty($sets['application']) || !is_array($sets['application'])) {
    delete_option( 'jsoft-awp-sets' );
    $jsoft_awp['sets'] = false;
    return false;
  }
  foreach(['application_id','transfer_key','api_key','api_secret'] as $key) {
    if(empty($sets['application'][$key])) {
      delete_option( 'jsoft-awp-sets' );
      $jsoft_awp['sets'] = false;
      return false;
    }
  }

  $reflected = false;
  $default_sets = jsoft_awp_default_sets();

  if(!isset($sets['package'])) {
    $sets['package'] = $default_sets['package'];
    $reflected = true;
  }

  if(!isset($sets['request_time'])) {
    $sets['request_time'] = $default_sets['request_time'];
    $reflected = true;
  }

  if(empty($sets['options']) || !is_array($sets['options'])) {
    $sets['options'] = $default_sets['options'];
    $reflected = true;
  }

  foreach($default_sets['options'] as $key => $value) {
    if(isset($sets['options'][$key])) continue;
    $sets['options'][$key] = $value;
    $reflected = true;
  }

  if($reflected) {
    update_option( 'jsoft-awp-sets', $sets);
    $jsoft_awp['sets'] = $sets;
  }
  return true;
}

function jsoft_awp_default_sets() {
  $blogurl = get_site_url();
  $blogname = get_option('blogname');
  $jsoft_awp_parseDomain = parse_url($blogurl);
  $jsoft_awp_parseDomain = (!empty($jsoft_awp_parseDomain) && !empty($jsoft_awp_parseDomain['host']))? $jsoft_awp_parseDomain['host'] : "website.com";
  $sets['application'] = false;
	$sets['options'] = array(
    			'rest_api_url' => rtrim(get_site_url(),'/'). '/?rest_route=',
    			'wp_rest_api_url' => rtrim(get_site_url(),'/'). '/?rest_route=/wp/v2',
    			'language' => 'en',
    			'home_page_id' => 0,
    			'page_direction' => 'left',
    			'posts_template' => 'cards',
    			'max_excerpt_length' => 200,
    			'excerpt_class' => 'description-wrapped',
    			'home_slider' => 1,
    			'category_slider' => 1,
    			'enable_comments' => 1,
    			'general_color' => 'positive',
    			'statusbar_color' => '',
    			'brand_title_color' => '#000000',
    			'post_headline_color' => '#000000',
    			'post_title_color' => '#000000',
    			'page_title_color' => '#000000',
    			'brand_title_decoration' => 'none',
    			'post_headline_decoration' => 'none',
    			'post_title_decoration' => 'none',
    			'page_title_decoration' => 'none',
    			'home_title' => 'Home',
    			'posts_title' => 'Posts',
    			'categories_title' => 'Categories',
    			'bookmarks_title' => 'Bookmarks',
    			'settings_title' => 'Settings',
    			'visit_website_title' => 'Visit Us',
    			'search_title' => 'Search',
    			'custom_menu_pages' => '',
    			'custom_menu_position' => 'bottom',
    			'application_menu_brand_type' => 'title_slogan_logo_small',
    			'application_menu_logo' => 'https://appbox.joudisoft.com/media/defaults/jsoft_awp/menu_logo.png',
    			'social_menu_position' => 'bottom',
    			'social_facebook_link' => 'https://www.facebook.com',
    			'social_twitter_link' => 'https://www.twitter.com',
    			'social_instagram_link' => 'https://www.instagram.com',
    			'google_admob_pub_id' => '',
    			'google_admob_unit_id' => '',
    			'google_admob_position' => 'BOTTOM_CENTER',
    			'google_admob_size' => 'SMART_BANNER',
      		'application_menu_title' => $blogname,
      		'application_menu_slogan' => 'General WordPress Mobile Application',
      		'website_url' => $blogurl,
      		'contact_email' => 'info@'.$jsoft_awp_parseDomain,
      		'contact_cc' => 'archive@'.$jsoft_awp_parseDomain,
	);

  $sets['package'] = array(
    			'title' => substr($blogname,0,124),
    			'description' => 'General WordPress Mobile Application',
    			'package_name' => substr('com.'.$jsoft_awp_parseDomain.'.awp.joudisoft',0,45),
    			'author' => 'joudiSoft ltd.',
    			'version' => '1.0.0',
    			'icon' => 'https://appbox.joudisoft.com/media/defaults/jsoft_awp/icon.png',
    			'splash_portrait' => "https://appbox.joudisoft.com/media/defaults/jsoft_awp/splash_portrait.jpg",
    			'splash_landscape' => 'https://appbox.joudisoft.com/media/defaults/jsoft_awp/splash_landscape.jpg',
    			'download_url' => NULL,
				'download_size' => 0,
    			'share_url' => NULL,
    			'date_update' => NULL,
    			'date_create' => NULL,
	);

  $sets['request_time'] = false;
	return $sets;
}
