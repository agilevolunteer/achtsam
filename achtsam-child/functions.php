<?php
add_action('init', 'my_theme_setup');
function my_theme_setup(){
	load_child_theme_textdomain('i-excel', get_stylesheet_directory() . '/languages');

}

// disable any and all mention of emoji's
remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'wp_print_styles', 'print_emoji_styles' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );
remove_filter( 'the_content_feed', 'wp_staticize_emoji' );
remove_filter( 'comment_text_rss', 'wp_staticize_emoji' );
remove_filter( 'wp_mail', 'wp_staticize_emoji_for_email' );

add_filter( 'wp_default_scripts', 'remove_jquery_migrate' );
function remove_jquery_migrate( &$scripts)
{
	if(!is_admin())
	{
		$scripts->remove( 'jquery');
		$scripts->add( 'jquery', false, array( 'jquery-core' ), '1.10.2' );
	}
}

add_action( 'wp_enqueue_scripts', 'achtsam_scripts_styles' , 15);
function achtsam_scripts_styles(){
	wp_dequeue_style("iexcel-style");
	wp_dequeue_style("owl-carousel");
	wp_dequeue_style("owl-carousel-theme");
	wp_dequeue_style("owl-carousel-transitions");
}


add_filter('stylesheet_uri','wpi_stylesheet_uri',10,2);
function wpi_stylesheet_uri($stylesheet_uri, $stylesheet_dir_uri){
	$filePath = get_stylesheet_directory()."/rev-manifest.json";
	if (file_exists($filePath)){
		$string = file_get_contents($filePath);
		$json_a = json_decode($string, true);
		return $stylesheet_dir_uri."/".$json_a['style/style.css'];
	} else {
		return $stylesheet_dir_uri."/style/style.css";
	}
}

