<?php
if( !defined('JSOFT_AWP_PLUGIN_DIR_URL') ) die('You are not allowed to access this page directly');

function jsoft_awp_postdata_sign($apiKey = NULL,$apiSecret,$postData) {
  if(!is_array($postData)) return false;
  if(!empty($apiKey)) $postData['api_key'] = $apiKey;
  if(!isset($postData['post_token'])) $postData['post_token'] = md5(time().mt_rand(100,1000));
  if(isset($postData['signature'])) unset($postData['signature']);
  ksort($postData);
  $signature = '';
  foreach($postData as $key => $val) {
      if((!is_string($val) && !is_numeric($val))) continue;
      $signature .= html_entity_decode(urldecode($val));
  }
  $postData['signature'] = md5($apiSecret.$signature);
  return $postData;
}

function jsoft_awp_do_router_access_auth($accessdata) {
  global $jsoft_awp;
  if(empty($accessdata) || !is_array($accessdata)) return false;
  $accessdata = array_merge(['a' => 'router','b' => 'get_access','slug' => 'wordpress_general_plugin'],$accessdata);
  $postResponse = jsoft_awp_http_post_remote_data($jsoft_awp['public_api_url'],$accessdata);
  $postResponse = jsoft_awp_do_check_json($postResponse)? json_decode($postResponse,true) : false;
  if(!jsoft_awp_check_response_success_exception($postResponse) || !isset($postResponse['exception']['key']) || !isset($postResponse['exception']['secret']))  return false;
  return ['key' => $postResponse['exception']['key'], 'secret' => $postResponse['exception']['secret']];
}

function jsoft_awp_do_router_post($postdata,$accessdata) {
  global $jsoft_awp;
  $accessAuth = jsoft_awp_do_router_access_auth($accessdata);
  if(!$accessAuth) return false;
  $postdata = jsoft_awp_postdata_sign($accessAuth['key'],$accessAuth['secret'],$postdata);
  return jsoft_awp_http_post_remote_data($jsoft_awp['router_api_url'],$postdata);
}

function jsoft_awp_do_application_post($postdata) {
  global $jsoft_awp;
  if(empty($jsoft_awp['application_api_url']) || empty($jsoft_awp['sets']['application']) || empty($jsoft_awp['sets']['application']['api_key'])
  || empty($jsoft_awp['sets']['application']['api_secret'])) return null;
  $postdata = jsoft_awp_postdata_sign($jsoft_awp['sets']['application']['api_key'],$jsoft_awp['sets']['application']['api_secret'],$postdata);
  return jsoft_awp_http_post_remote_data($jsoft_awp['application_api_url'],$postdata);
}
