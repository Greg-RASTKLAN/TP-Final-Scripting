/// @description Apparition et disparition Weapon Wheel

if (mouse_check_button_pressed(mb_right)) {
    if (!visible) {
        visible = true;
        mouse_pos_x = device_mouse_x_to_gui(0);
        mouse_pos_y = device_mouse_y_to_gui(0);
    }
} 

// Selection d'arme au moment de relacher le bouton en fonction de la position du curseur
if (mouse_check_button_released(mb_right)) {
    if(selected_index == 0) {
		show_debug_message("epee");
		Obj_Avatar.EquippedWeapon = "Sword";

	}
	else if(selected_index == 1) {
		show_debug_message("bow");
		Obj_Avatar.EquippedWeapon = "Bow";

	}
	else {
		show_debug_message("feu");
		Obj_Avatar.EquippedWeapon = "Magic";

	}
	
	visible = false;
}
