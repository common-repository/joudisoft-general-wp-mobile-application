<?php
add_filter( 'allowed_http_origins', 'jsoft_awp_add_allowed_origins' );
function jsoft_awp_add_allowed_origins($origins) {
    $origins[] = '';
    $origins[] = '*';
    return $origins;
}

add_filter( 'rest_prepare_post', 'jsoft_awp_dt_use_raw_post_content', 10, 3 );
function jsoft_awp_dt_use_raw_post_content( $data, $post, $request ) {
    if(class_exists('WPBMap')) WPBMap::addAllMappedShortcodes();
    $data->data['content']['rendered'] = apply_filters( 'the_content', $post->post_content );
    return $data;
}

add_action('rest_api_init', function () {
  register_rest_route('jsoft_awp', '/check/', array(
    'methods' => array('GET','POST'),
    'callback' => 'jsoft_awp_wp_json_check',
  ));

  register_rest_route('jsoft_awp', '/prevalidation/', array(
    'methods' => array('GET','POST'),
    'callback' => 'jsoft_awp_wp_json_prevalidation',
  ));

  register_rest_route('jsoft_awp', '/validation/', array(
    'methods' => array('GET','POST'),
    'callback' => 'jsoft_awp_wp_json_validation',
  ));
});

function jsoft_awp_wp_json_check( WP_REST_Request $request ) {
  return jsoft_awp_do_response_json('Valid Transaction','success');
}

function jsoft_awp_wp_json_prevalidation( WP_REST_Request $request ) {
 global $jsoft_awp;

 $validateToken = get_option('jsoft-awp-ctoken');
 if(!$validateToken || empty($request['check_token']) || md5($validateToken) !== $request['check_token'])
       return new \WP_Error(
             'rest_forbidden',
             esc_html__( 'Sorry, you are not allowed to do that.', 'wpse' ),
             array('status' => 403 )
       );

 if(empty($request['secure_token']) || empty($request['post_token']))
	  return jsoft_awp_do_response_json('Invalid Request','error');

  $secure_token_post_token = md5($request['post_token'].$validateToken);

  $result = md5($request['post_token'].$request['check_token']);

  if((string) $request['secure_token'] == $secure_token_post_token) {
	  return jsoft_awp_do_response_json('Valid Transaction','success',$result);
  }

  return new \WP_Error(
        'rest_forbidden',
        esc_html__( 'Sorry, you are not allowed to do that.', 'wpse' ),
        array('status' => 403 )
  );
}

function jsoft_awp_wp_json_validation( WP_REST_Request $request ) {
 global $jsoft_awp;

 $validateToken = get_option('jsoft-awp-ctoken');
 if(!$validateToken || empty($request['check_token']) || md5($validateToken) !== $request['check_token'])
       return new \WP_Error(
             'rest_forbidden',
             esc_html__( 'Sorry, you are not allowed to do that.', 'wpse' ),
             array('status' => 403 )
       );

 $accessData = [
     'blog_name' => get_option('blogname'),
     'blog_domain' => $jsoft_awp['plugin']['blog_domain'],
     'blog_url' => $jsoft_awp['plugin']['blog_url'],
     'server_ip' => !empty(jsoft_awp_do_getserv('SERVER_ADDR'))? jsoft_awp_do_getserv('SERVER_ADDR') : jsoft_awp_do_getserv('LOCAL_ADDR'),
     'rest_api_url' => $jsoft_awp['plugin']['rest_api_url'],
     'wp_rest_api_url' => $jsoft_awp['plugin']['wp_rest_api_url'],
     'wp_rest_check_token' => $validateToken,
  ];

 $accessAuth = jsoft_awp_do_router_access_auth($accessData);
 if(!$accessAuth)
   return new \WP_Error(
         'rest_forbidden',
         esc_html__( 'Sorry, you are not allowed to do that.', 'wpse' ),
         array('status' => 403 )
   );

 if(empty($accessAuth) || empty($accessAuth['secret']))
	  return jsoft_awp_do_response_json('Invalid Access Auth Data','error');

 if(empty($request['secure_token']) || empty($request['post_token']))
	  return jsoft_awp_do_response_json('Invalid Request','error');

  $secure_token_post_token = md5($request['post_token'].$accessAuth['secret']);

  $result = md5($request['post_token'].$request['check_token']);

  if((string) $request['secure_token'] == $secure_token_post_token) {
	  return jsoft_awp_do_response_json('Valid Transaction','success',$result);
  }

  return new \WP_Error(
        'rest_forbidden',
        esc_html__( 'Sorry, you are not allowed to do that.', 'wpse' ),
        array('status' => 403 )
  );
}
