<?php
/* @var $EM_Event EM_Event */
$tags = get_the_terms($EM_Event->post_id, EM_TAXONOMY_TAG);
if( is_array($tags) && count($tags) > 0 ){
	$tags_list = array();
	?>
	<ul class="event-categories">
	<?php
	foreach($tags as $tag){
		$link = get_term_link($tag->slug, EM_TAXONOMY_TAG);
		if ( is_wp_error($link) ) $link = '';
		echo '<li><a href="'. $link .'" title="'. $tag->name .'">'. $tag->name .'</a></li>';
	}
	?>
	</ul>
	<?php
}
?>
