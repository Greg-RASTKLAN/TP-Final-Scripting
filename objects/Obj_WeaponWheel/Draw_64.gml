if (visible) {
	
	// Cette variable indique l'angle vers lequel va la souris durant l'apparition de la wheel
	angle_to_mouse = round(point_direction(mouse_pos_x, mouse_pos_y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)));

	// Détermine l'index du segment survolé en fonction de l'angle
	if (angle_to_mouse > 30 && angle_to_mouse < 150) selected_index = 0;
	else if (angle_to_mouse > 150 && angle_to_mouse < 270) selected_index = 2; 	
	else if (angle_to_mouse > 270 && angle_to_mouse < 359 || angle_to_mouse >= 0 && angle_to_mouse <= 30) selected_index = 1;
	
	//Wheel Background
	draw_sprite_ext(Spr_WeaponWheel_Back, selected_index, mouse_pos_x, mouse_pos_y, 1, 1, 0, c_white, 1);
	// Affiche chaque arme de la weapon wheel
	for (var i = 0; i < 3; i++) {
	    
	    var draw_angle;
		
	    if (i == 0) draw_angle = 50;
		else if (i == 1) draw_angle = 290;
		else draw_angle = 170; 
		
	    // Applique la surbrillance si le segment est survolé
	    if (i == selected_index) {
			draw_sprite_ext(Spr_WeaponWheel, i, mouse_pos_x, mouse_pos_y, 1, 1, draw_angle, c_white, 1);
	    } else {
	        draw_sprite_ext(Spr_WeaponWheel, i, mouse_pos_x, mouse_pos_y, 1, 1, draw_angle, c_white, 0.5);
	    }
	}

	// Trace la ligne de direction et affiche l'angle et l'index sélectionné pour débogage
	draw_line_width_color(mouse_pos_x, mouse_pos_y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 6, c_blue, c_aqua);
	//draw_text(mouse_pos_x, mouse_pos_y, string(angle_to_mouse) + "   " + string(selected_index));
}