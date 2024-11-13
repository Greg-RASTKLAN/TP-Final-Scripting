/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

show_debug_message(current_dialog.message);
if(showing_dialog == true) {
	text_x = 30;
	text_y = 18;
	height = 32;
	border = 5;
	padding = 16;

	
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
	
	draw_set_color(c_white);
	draw_text(text_x, text_y, current_dialog.message);
	
	alpha = lerp(alpha, 1, 0.06);
	
}

draw_set_alpha(1);