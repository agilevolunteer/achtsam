<?php
/**
 * The template for displaying the footer
 *
 * Contains footer content and the closing of the #main and #page div elements.
 *
 * @package i-excel
 * @since i-excel 1.0
 */
?>

		</div><!-- #main -->
		<footer id="colophon" class="site-footer" role="contentinfo">
			<div class="site-info-partner">
				<img src="<?php echo get_stylesheet_directory_uri() ?>/assets/artgerecht.png" />
				<img src="<?php echo get_stylesheet_directory_uri() ?>/assets/bow.jpg" />
				<img src="<?php echo get_stylesheet_directory_uri() ?>/assets/stoffwindelexperten.jpg" />
				<img src="<?php echo get_stylesheet_directory_uri() ?>/assets/zwergensprache.png" />
				<!--
				<img src="http://achtsam-miteinander.de/wp-content/uploads/sites/3/2015/10/bow_logo-300x250.jpg" height="120"/>
				<img src="http://achtsam-miteinander.de/wp-content/uploads/sites/3/2015/10/logo-300x120.jpg" height="120"/>
				<img src="http://babyzeichensprache.com/png/logo-zwergensprache.png" height="120"/>-->

			</div>
        	<div class="footer-bg clearfix">
                <div class="widget-wrap">
                    <?php get_sidebar( 'main' ); ?>
                </div>
			</div>

			<div class="site-info">
				<div class="copyright">
					<?php esc_attr_e( 'Copyright &copy;', 'i-excel' ); ?>  <?php bloginfo( 'name' ); ?>
				</div>
			</div><!-- .site-info -->
		</footer><!-- #colophon -->
	</div><!-- #page -->

	<?php wp_footer(); ?>

	<?php if(!isset($_COOKIE["eu-cookie"])) { ?>
		<div class="agv-eucookie" eu-cookie>
			<span class="agv-eucookie__text">Diese Website benutzt Cookies. Wenn Sie die Website weiter nutzen, stimmen Sie der Verwendung von Cookies zu.</span>
			<button class="agv-eucookie__accept">OK</button>
		</div>
	<?php } ?>
</body>
</html>
