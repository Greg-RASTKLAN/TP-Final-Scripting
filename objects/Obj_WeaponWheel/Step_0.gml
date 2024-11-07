/// @description Input Weapon Wheel

if (keyboard_check_pressed(ord("F"))) {
    // Apparition de la roue si elle n'est pas visible
    if (!visible) {
        visible = true;
        mouse_pos_x = device_mouse_x_to_gui(0);
        mouse_pos_y = device_mouse_y_to_gui(0);
    }

    // Détermine quel segment est survolé
		angle_to_mouse = round(point_direction(mouse_pos_x, mouse_pos_y, device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)));
    //selected_index = floor((angle_to_mouse + angle_offset) / 120) mod 3;
	
		if (angle_to_mouse > 30 && angle_to_mouse < 150){selected_index = 0;}
		if (angle_to_mouse > 150 && angle_to_mouse < 270){selected_index = 1;}
		if (angle_to_mouse > 270 && angle_to_mouse < 359 || angle_to_mouse > 0 && angle_to_mouse < 29){selected_index = 2;}
} 

if (keyboard_check_released(ord("F"))) {
    // Disparition de la roue et réinitialisation des variables
    visible = false;
    selected_index = -1;
}
