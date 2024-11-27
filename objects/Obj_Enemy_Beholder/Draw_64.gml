/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur


if(AvatarState == "Death"){
	var view_width = camera_get_view_width(view_camera[0]);
	var view_height = camera_get_view_height(view_camera[0]);
	var sprite_x = view_width / 2; 
	var sprite_y = view_height / 2;
	draw_sprite_ext(Spr_Victory, 0, sprite_x -100, sprite_y, 2, 2, 0, c_white, 1);
	
	instance_create_layer(x, y + 100, "Instances", Obj_ButtonMenuBack);
}
