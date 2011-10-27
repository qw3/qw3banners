$(document).ready( function() {
	rotacionar = true
	if( $("div.thumbnails ul li").size() <= 1 ) {
	  rotacionar = false
	}
	  
	
	$("#qw3banners .container").wtRotator({
		mouseover_pause:true,
		display_thumbs:rotacionar,
		display_dbuttons:false,
		display_playbutton:false,
		display_numbers:rotacionar,
		display_timer:false,
		tooltip_type:"none",
		auto_start:rotacionar,
		
	});
}
);
