<?php
if( !defined('JSOFT_AWP_PLUGIN_DIR_URL') ) die('You are not allowed to access this page directly');

define('JSOFT_AWP_HTTP_URL_REPLACE', 1);
define('JSOFT_AWP_HTTP_URL_JOIN_PATH', 2);
define('JSOFT_AWP_HTTP_URL_JOIN_QUERY', 4);
define('JSOFT_AWP_HTTP_URL_STRIP_USER', 8);
define('JSOFT_AWP_HTTP_URL_STRIP_PASS', 16);
define('JSOFT_AWP_HTTP_URL_STRIP_AUTH', 32);
define('JSOFT_AWP_HTTP_URL_STRIP_PORT', 64);
define('JSOFT_AWP_HTTP_URL_STRIP_PATH', 128);
define('JSOFT_AWP_HTTP_URL_STRIP_QUERY', 256);
define('JSOFT_AWP_HTTP_URL_STRIP_FRAGMENT', 512);
define('JSOFT_AWP_HTTP_URL_STRIP_ALL', 1024);

function jsoft_awp_http_build_url($url, $parts=array(), $flags=JSOFT_AWP_HTTP_URL_REPLACE, &$new_url=false)
{
	$keys = array('user','pass','port','path','query','fragment');

	if ($flags & JSOFT_AWP_HTTP_URL_STRIP_ALL)
	{
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_USER;
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_PASS;
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_PORT;
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_PATH;
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_QUERY;
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_FRAGMENT;
	}

	else if ($flags & JSOFT_AWP_HTTP_URL_STRIP_AUTH)
	{
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_USER;
		$flags |= JSOFT_AWP_HTTP_URL_STRIP_PASS;
	}

	$parse_url = !is_array($url) ? parse_url($url) : $url;

	if (isset($parts['scheme']))
		$parse_url['scheme'] = $parts['scheme'];
	if (isset($parts['host']))
		$parse_url['host'] = $parts['host'];

	if ($flags & JSOFT_AWP_HTTP_URL_REPLACE)
	{
		foreach ($keys as $key)
		{
			if (isset($parts[$key]))
				$parse_url[$key] = $parts[$key];
		}
	}
	else
	{

		if (isset($parts['path']) && ($flags & JSOFT_AWP_HTTP_URL_JOIN_PATH))
		{
			if (isset($parse_url['path']))
				$parse_url['path'] = rtrim(str_replace(basename($parse_url['path']), '', $parse_url['path']), '/') . '/' . ltrim($parts['path'], '/');
			else
				$parse_url['path'] = $parts['path'];
		}

		if (isset($parts['query']) && ($flags & JSOFT_AWP_HTTP_URL_JOIN_QUERY))
		{
			if (isset($parse_url['query']))
				$parse_url['query'] .= '&' . $parts['query'];
			else
				$parse_url['query'] = $parts['query'];
		}
	}

	foreach ($keys as $key)
	{
		if ($flags & (int)constant('JSOFT_AWP_HTTP_URL_STRIP_' . strtoupper($key)))
			unset($parse_url[$key]);
	}


	$new_url = $parse_url;

	return
		 ((isset($parse_url['scheme'])) ? $parse_url['scheme'] . '://' : '')
		.((isset($parse_url['user'])) ? $parse_url['user'] . ((isset($parse_url['pass'])) ? ':' . $parse_url['pass'] : '') .'@' : '')
		.((isset($parse_url['host'])) ? $parse_url['host'] : '')
		.((isset($parse_url['port'])) ? ':' . $parse_url['port'] : '')
		.((isset($parse_url['path'])) ? $parse_url['path'] : '')
		.((isset($parse_url['query'])) ? '?' . $parse_url['query'] : '')
		.((isset($parse_url['fragment'])) ? '#' . $parse_url['fragment'] : '')
	;
}
