<?php
if( !defined('JSOFT_AWP_PLUGIN_PATH') ) die('You are not allowed to access this page directly');

add_action( 'admin_menu', 'jsoft_awp_plugin_menu_page' );
function jsoft_awp_plugin_menu_page() {
  add_menu_page( 'Application Box General WordPress Mobile Application by joudiSoft', 'General Mobile Application', 'manage_options', 'appbox-wordpress-general', 'jsoft_awp_render_output', 'dashicons-smartphone', 90 );
}

add_action( 'admin_enqueue_scripts', 'jsoft_awp_selectively_enqueue_admin_script' );
function jsoft_awp_selectively_enqueue_admin_script( $hook ) {
    if ( 'toplevel_page_appbox-wordpress-general' != $hook ) {
        return;
    }
    wp_enqueue_style( 'jsoft_awp_style', JSOFT_AWP_PLUGIN_DIR_URL . '/assets/css/style.css', array(), '1.0' );
    wp_enqueue_script( 'bootstrap', JSOFT_AWP_PLUGIN_DIR_URL . '/assets/libs/bootstrap/bootstrap.min.js', array(), '3.3.7' );
	wp_enqueue_script('jquery');
    wp_enqueue_script( 'bootstrap_select', JSOFT_AWP_PLUGIN_DIR_URL . '/assets/libs/bootstrap/bootstrap-select.js', array(), '1.12.2' );
    wp_enqueue_script( 'spectrum', JSOFT_AWP_PLUGIN_DIR_URL . '/assets/libs/spectrum/spectrum.min.js', array(), '1.8.0' );
    wp_enqueue_script( 'jquery-simplecolorpicker', JSOFT_AWP_PLUGIN_DIR_URL . '/assets/libs/jquery-simplecolorpicker/jquery.simplecolorpicker.js', array(), '0.3.1' );
    wp_enqueue_script( 'jsoft_awp_javascript', JSOFT_AWP_PLUGIN_DIR_URL . '/assets/js/appbox.js', array(), '1.0', true );
    wp_enqueue_media();
}
