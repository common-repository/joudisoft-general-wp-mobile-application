<?php
/**
 * @package appbox-wordpress-general
 * @version 1.2.0
 */
/*
Plugin Name: joudiSoft General WordPress Mobile Application
Plugin URI: https://www.joudisoft.com/products/application-box
Description: Create your awesome mobile application in minutes using joudiSoft General WordPress Mobile Application Plugin.
Version: 1.2
Author: joudiSoft ltd.
Author URI: https://www.joudisoft.com/
*/

/*
Copyright (C) 2019  joudiSoft ltd. (email : info@joudisoft.com).
*/

if(!function_exists('add_action')) die('You are not allowed to access this page directly');

ini_set('memory_limit','256M');
set_time_limit(0);

define("JSOFT_AWP_PLUGIN_DIR_URL",rtrim(plugin_dir_url( __FILE__ ),'/'));
define("JSOFT_AWP_PLUGIN_PATH",dirname( __FILE__ ));

$josft_awp_missed = [];

if(!function_exists('phpversion') || round(phpversion(),2) < 5.6) {
  $josft_awp_missed[] = 'PHP Version 5.6 or Newer';
}

if(empty($josft_awp_missed)) require_once(JSOFT_AWP_PLUGIN_PATH . '/app-init.php');
else require_once(JSOFT_AWP_PLUGIN_PATH . '/viewmissed.php');
?>
