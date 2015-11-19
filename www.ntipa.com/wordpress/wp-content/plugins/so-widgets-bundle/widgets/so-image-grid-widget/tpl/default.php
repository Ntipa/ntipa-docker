<?php if( !empty($instance['images']) ) : ?>
	<div class="sow-image-grid-wrapper"
		<?php if( !empty( $instance['display']['max_width'] ) ) echo 'data-max-width="' . intval( $instance['display']['max_width'] ) . '"' ?>
		<?php if( !empty( $instance['display']['max_height'] ) ) echo 'data-max-height="' . intval( $instance['display']['max_height'] ) . '"' ?>
		>
		<?php
		foreach( $instance['images'] as $image ) {
			echo '<div class="sow-image-grid-image">';
			echo wp_get_attachment_image( $image['image'], $image['display']['image_size'], false, array(
				'title' => $image['title']
			) );
			echo '</div>';
		}
		?>
	</div>
<?php endif; ?>