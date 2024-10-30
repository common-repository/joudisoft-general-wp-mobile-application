<?php
if( !defined('JSOFT_AWP_PLUGIN_DIR_URL') ) die('You are not allowed to access this page directly');

function jsoft_awp_do_getserv($var) {
	if(isset($_SERVER[$var]))
		return $_SERVER[$var];
	elseif(function_exists('getenv'))
		return getenv($var);
	return NULL;
}

function jsoft_awp_do_check_json($string) {
  if(!is_string($string)) return false;
  json_decode($string);
  return (json_last_error() == JSON_ERROR_NONE);
}

function jsoft_awp_do_decode_json_array($array,$checkKeys = NULL) {
  if(!$array || !is_string($array) || !jsoft_awp_do_check_json($array)) return NULL;
  $array = json_decode($array,true);
  if(empty($array)) return NULL;
  if(!empty($checkKeys) && is_array($checkKeys)) {
    foreach($checkKeys as $key) {
      if(!isset($array[$key])) return NULL;
    }
  }
  return $array;
}

function jsoft_awp_check_response($postResponse) {
  if(!empty($postResponse) && is_array($postResponse) && !empty($postResponse['type']) && !empty($postResponse['msg']))
    return true;
  return false;
}

function jsoft_awp_check_response_success($postResponse) {
  if(!empty($postResponse) && is_array($postResponse) && !empty($postResponse['type']) && $postResponse['type'] == 'success')
    return true;
  return false;
}

function jsoft_awp_check_response_exception($postResponse) {
  if(!empty($postResponse) && is_array($postResponse) && !empty($postResponse['exception']) && is_array($postResponse['exception']))
      return true;
  return false;
}

function jsoft_awp_check_response_success_exception($postResponse) {
  if(!empty($postResponse) && is_array($postResponse) && !empty($postResponse['type'])
  && $postResponse['type'] == 'success' && !empty($postResponse['exception']) && is_array($postResponse['exception']))
    return true;
  return false;
}

function jsoft_awp_update_sets_exception($jsoft_awp_sets,$postResponse,$resetTimer = true) {
  if(isset($postResponse['exception']['_overwrite'])) {
    if(is_array($postResponse['exception']['_overwrite']))
      foreach($postResponse['exception']['_overwrite'] as $key => $value) {
        if(!isset($jsoft_awp_sets[$key]) || !is_array($value))
          $jsoft_awp_sets[$key] = $value;
        elseif(isset($jsoft_awp_sets[$key]) && is_array($jsoft_awp_sets[$key]) && !is_array($value))
          continue;
        elseif(is_array($value)) foreach($value as $kx => $kv) {
          $jsoft_awp_sets[$key][$kx] = $kv;
        }
      }
    unset($postResponse['exception']['_overwrite']);
  }
  foreach($postResponse['exception'] as $key => $value) {
    if(substr($key,0,1) == '_') continue;
    $jsoft_awp_sets[$key] = $value;
  }
  if($resetTimer) $jsoft_awp_sets['request_time'] = time();
  update_option( 'jsoft-awp-sets', $jsoft_awp_sets);
  return $jsoft_awp_sets;
}

function jsoft_awp_http_post_remote_data($url,$postdata) {
	$response = wp_remote_post($url,['timeout' => 120,'sslverify' => false,'body' => $postdata]);
	return !empty(wp_remote_retrieve_body($response))? wp_remote_retrieve_body($response) : false;
}

function jsoft_awp_http_fetch_remote_data($url) {
	$response = wp_remote_get($url,['timeout' => 120,'sslverify' => false]);
	return !empty(wp_remote_retrieve_body($response))? wp_remote_retrieve_body($response) : false;
}

function jsoft_awp_do_validate_v($v) {
	if(!$v->validate()) {
		if($v->errors()) {
			$error = $v->errors();
			while(is_array($error)) {
				$error = reset($error);
			}
			return $error;
		} else return 'Invalid Inputs';
	}
return true;
}

function jsoft_awp_do_convert_period($period,$from_unit = 'seconds',$to_unit = 'seconds') {
  if(!$from_unit) {
    $period_units = ["seconds","minutes","hours","days","weeks","months","years"];
  	$from_unit = preg_split('/(?<=[0-9])(?=[a-z]+)/i',preg_replace('/[^\da-z]/i', '', $period));
    $from_unit = (empty($from_unit) || !isset($from_unit[1]))? 'seconds' : strtolower($from_unit[1]);
  	if(!in_array($from_unit,$period_units)) $from_unit = "seconds";
  }
	$period = round($period,4);
  $from_unit = strtolower($from_unit); $to_unit = strtolower($to_unit);
  $timetable = ["seconds"=>1,"minutes"=>60,"hours"=>3600,"days"=>86400,"weeks"=>604800,"months"=>2635200,"years"=>31536000];
  if(!isset($timetable[$from_unit],$timetable[$to_unit]))
  	return round($period);
  else return round( ($period * $timetable[$from_unit]) / $timetable[$to_unit] );
}

function jsoft_awp_do_convert_size($size,$from_unit = false,$to_unit = false,$int_decimal = 0) {
  if(!$from_unit) {
    $from_unit = preg_replace('/[^bkmgtpezy]/i', '', $size);
    if(!$from_unit) $from_unit = 'b';
  }
	$size = round($size,4);
  $from_unit = ( $from_unit && strpos('bkmgtpezy',strtolower($from_unit[0])) ) ?
  				 strtolower($from_unit[0]) : preg_replace('/[^bkmgtpezy]/i', '', $size);
  if(!$from_unit) $from_unit = 'b';
  $to_unit = ( $to_unit && strpos('bkmgtpezy',strtolower($to_unit[0])) ) ? strtolower($to_unit[0]) : 'b';
  if($to_unit == 'b') $int_decimal = 0;
  $size = preg_replace('/[^0-9\.]/', '', $size);
	$result = round(($size * pow(1024, stripos('bkmgtpezy', $from_unit))) / pow(1024, stripos('bkmgtpezy', $to_unit)), $int_decimal);
	return $result;
}

function jsoft_awp_do_base64url_encode($data) {
  return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

function jsoft_awp_do_base64url_decode($data) {
  return base64_decode(str_pad(strtr($data, '-_', '+/'), strlen($data) % 4, '=', STR_PAD_RIGHT));
}

function jsoft_awp_do_response($content,$type = "text",$exit = true) {
	switch($type) {
		case '403':
			header('HTTP/1.0 403 Forbidden');
		break;
		case '404':
			header("HTTP/1.1 404 Not Found");
		break;
		case '503':
			header('HTTP/1.1 503 Service Temporarily Unavailable');
		break;
		case 'json':
			header('Content-type: application/json');
			$content = json_encode($content);
		break;
		default:
			header('Content-type: text/plain');
			$content = print_r($content,true);
	}
	if($exit == true) {
		echo $content;
		exit();
	} else return $content;
}

function jsoft_awp_do_deny_access() {
	jsoft_awp_do_response("Forbidden: Access is Denied",'403');
}

function jsoft_awp_do_deny_if($mix,$type = 'variable') {
	switch($type) {
		case 'variable':
			if(!empty($mix)) jsoft_awp_do_deny_access();
		break;
		case 'array':
			foreach($mix as $arg) {
				if(!empty($arg)) jsoft_awp_do_deny_access();
			}
		break;
	}
return true;
}

function jsoft_awp_do_deny_ifnot($mix,$type = 'variable') {
	switch($type) {
		case 'variable':
			if(empty($mix)) jsoft_awp_do_deny_access();
		break;
		case 'array':
			foreach($mix as $arg) {
				if(empty($arg)) jsoft_awp_do_deny_access();
			}
		break;
	}
return true;
}

function jsoft_awp_do_filter_array($array,$keys) {
	foreach($array as $key => $value) {
		if(!in_array($key,$keys)) unset($array[$key]);
	}
	return $array;
}

function jsoft_awp_do_response_json($msg = false,$type = NULL, $exception = NULL, $joins = NULL) {
	if(empty($type)) return jsoft_awp_do_response($msg,'json');
	$data = array('msg' => $msg,'type' => $type);
	if(!empty($exception)) $data['exception'] = $exception;
	if(!empty($joins) && is_array($joins))
		foreach($joins as $key => $value) {
		  $data[$key] = $value;
		}
	return jsoft_awp_do_response($data,'json');
}

function jsoft_awp_get_client_ip_address() {
	if(( defined(PHP_SAPI) && PHP_SAPI == 'cli') || php_sapi_name() == 'cli' || strpos(php_sapi_name(), 'cgi' !== false))
		return gethostname();
	if (!empty(jsoft_awp_do_getserv('HTTP_CLIENT_IP')) && filter_var(jsoft_awp_do_getserv('HTTP_CLIENT_IP'), FILTER_VALIDATE_IP))
		return jsoft_awp_do_getserv('HTTP_CLIENT_IP');

	if (!empty(jsoft_awp_do_getserv('HTTP_X_FORWARDED_FOR'))) {
		if (strpos(jsoft_awp_do_getserv('HTTP_X_FORWARDED_FOR'), ',') !== false) {
			$iplist = explode(',', jsoft_awp_do_getserv('HTTP_X_FORWARDED_FOR'));
			foreach ($iplist as $ip) {
				if (filter_var($ip, FILTER_VALIDATE_IP))
					return $ip;
			}
		} else {
			if (filter_var(jsoft_awp_do_getserv('HTTP_X_FORWARDED_FOR'), FILTER_VALIDATE_IP))
				return jsoft_awp_do_getserv('HTTP_X_FORWARDED_FOR');
		}
	}
	if (!empty(jsoft_awp_do_getserv('HTTP_X_FORWARDED')) && filter_var(jsoft_awp_do_getserv('HTTP_X_CLUSTER_CLIENT_IP'), FILTER_VALIDATE_IP))
			return jsoft_awp_do_getserv('HTTP_X_FORWARDED');
	if (!empty(jsoft_awp_do_getserv('HTTP_X_CLUSTER_CLIENT_IP')) && filter_var(jsoft_awp_do_getserv('HTTP_X_CLUSTER_CLIENT_IP'), FILTER_VALIDATE_IP))
			return jsoft_awp_do_getserv('HTTP_X_CLUSTER_CLIENT_IP');
	if (!empty( jsoft_awp_do_getserv('HTTP_FORWARDED_FOR')) && filter_var(jsoft_awp_do_getserv('HTTP_FORWARDED_FOR'), FILTER_VALIDATE_IP))
			return jsoft_awp_do_getserv('HTTP_FORWARDED_FOR');
	if (!empty(jsoft_awp_do_getserv('HTTP_FORWARDED')) && filter_var(jsoft_awp_do_getserv('HTTP_FORWARDED'), FILTER_VALIDATE_IP))
			return jsoft_awp_do_getserv('HTTP_FORWARDED');
	return jsoft_awp_do_getserv('REMOTE_ADDR');
}

function jsoft_awp_render_smart_escape($mixed) {
	if(empty($mixed) || (!is_string($mixed) && !is_array($mixed))) return $mixed;
	if(is_string($mixed))
			$mixed = html_entity_decode(htmlspecialchars_decode($mixed));
	elseif(is_array($mixed))
		foreach($mixed as $key => $value) {
			$mixed[$key] = jsoft_awp_render_smart_escape($value);
		}
	return $mixed;
}
