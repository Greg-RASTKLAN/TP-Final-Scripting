if (visible) {
    draw_set_alpha(0.7);
	
	// Détermine quel segment est survolé
		angle_to_mouse = round(point_direction(mouse_pos_x, mouse_pos_y, device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)));
    //selected_index = floor((angle_to_mouse + angle_offset) / 120) mod 3;
	
		if (angle_to_mouse > 30 && angle_to_mouse < 150){selected_index = 0;}
		if (angle_to_mouse > 150 && angle_to_mouse < 270){selected_index = 1;}
		if (angle_to_mouse > 270 && angle_to_mouse < 359 || angle_to_mouse > 0 && angle_to_mouse < 29){selected_index = 2;}
	
	
    // Affiche l'arc de cercle vierge de la *weapon wheel*
    for (var i = 0; i < 3; i++) {
        var draw_angle = i * 120; // Angle pour chaque segment de 120°

        // Applique la surbrillance si le segment est survolé
        if (i == selected_index) {
            draw_sprite_ext(Spr_WeaponWheel, 0, mouse_pos_x, mouse_pos_y, 1, 1, draw_angle, highlight_color, 1);
        } else {
            draw_sprite_ext(Spr_WeaponWheel, 0, mouse_pos_x, mouse_pos_y, 1, 1, draw_angle, c_white, 1);
        }
    }
	
    // Affiche les icônes d'armes sur chaque segment
    var weapon_sprites = [Spr_Bow, Spr_Magic, Spr_Sword];
    for (var j = 0; j < 3; j++) {
        var weapon_angle = j * 250;
        var x_offset = lengthdir_x(100, weapon_angle);
        var y_offset = lengthdir_y(100, weapon_angle);

        // Dessine chaque sprite d'arme au centre du segment
        draw_sprite(weapon_sprites[j], 0, mouse_pos_x + x_offset, mouse_pos_y + y_offset);
    }
	
	
	draw_line_width_color(mouse_pos_x,mouse_pos_y,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),6,c_blue,c_aqua);
	draw_text(mouse_pos_x,mouse_pos_y,string(angle_to_mouse)+"   "+string(selected_index));
	
    // Remet la transparence par défaut
    draw_set_alpha(1);
}