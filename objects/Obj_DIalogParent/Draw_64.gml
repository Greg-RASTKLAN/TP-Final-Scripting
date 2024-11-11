/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(showing_dialog == true) {
	text_x = 30;
	text_y = 18;
	height = 32;
	border = 5;
	padding = 16;

	/*height = string_height(current_dialog.message);
	
	if(sprite_get_height(current_dialog.sprite) > height) {
		height = sprite_get_height(current_dialog.sprite);
	}*/
	
	height += padding * 2;
	text_x = sprite_get_width(current_dialog.sprite) + (padding * 2);
	
	draw_set_alpha(alpha);
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), height, false);
	
	draw_set_color(c_white);
	draw_rectangle(border, border, display_get_gui_width() - border, height - border, false);
	
	draw_set_color(c_black);
	draw_rectangle((border * 2), (border * 2), display_get_gui_width() - (border * 2), height - (border * 2), false);
	
	if(current_dialog.sprite != -1) {
		draw_sprite(current_dialog.sprite, 0, border * 3, border * 3);		
	}
	
	/*draw_set_color(c_white);
	draw_rectangle(text_x, text_y, current_dialog.message, 16, display_get_gui_width() - 192);*/
	
	alpha = lerp(alpha, 1, 0.06);
	
}

draw_set_alpha(1);