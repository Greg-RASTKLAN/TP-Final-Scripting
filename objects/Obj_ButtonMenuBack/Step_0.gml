/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur


var hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);

if(hover == 1) {
	image_xscale = start_scaleMax;	
	image_yscale = start_scaleMax;	
	
}
else {
	image_xscale = start_scale;
	image_yscale = start_scale;
}