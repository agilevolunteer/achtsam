<?php

//define('ACHTSAMPATH',dirname(__FILE__).'/');

add_action('init', 'my_theme_setup');
function my_theme_setup(){
	load_child_theme_textdomain('i-excel', get_stylesheet_directory() . '/languages');
}