<?php
if( !defined('JSOFT_AWP_PLUGIN_PATH') ) die('You are not allowed to access this page directly');

require_once( JSOFT_AWP_PLUGIN_PATH . '/functions.php');

$jsoft_awp = [
	'public_api_url' => 'https://appbox.joudisoft.com/server/api/public/index.php',
	'router_api_url' => 'https://appbox.joudisoft.com/server/api/router/index.php',
	'application_api_url' => 'https://appbox.joudisoft.com/server/api/application/index.php',
];

$jsoft_awp_parseDomain = parse_url(get_site_url());
$jsoft_awp_parseDomain = (!empty($jsoft_awp_parseDomain) && !empty($jsoft_awp_parseDomain['host']))? $jsoft_awp_parseDomain['host'] : NULL;

$jsoft_awp['plugin'] = array(
	'plugin_url' => JSOFT_AWP_PLUGIN_DIR_URL,
	'plugin_path' => JSOFT_AWP_PLUGIN_PATH,
	'blog_domain' => $jsoft_awp_parseDomain,
	'blog_url' => rtrim(get_site_url(),'/'),
	'rest_api_url' => rtrim(get_site_url(),'/'). '/?rest_route=',
	'wp_rest_api_url' => rtrim(get_site_url(),'/'). '/?rest_route=/wp/v2',
);

$jsoft_awp['sets'] = get_option('jsoft-awp-sets');
jsoft_awp_check_sets();

$jsoft_awp_notices = array();

require_once(JSOFT_AWP_PLUGIN_PATH . "/wp-json.php");
require_once(JSOFT_AWP_PLUGIN_PATH . "/render.php");
require_once(JSOFT_AWP_PLUGIN_PATH . "/viewport.php");
