/// @description Input Weapon Wheel

if (keyboard_check_pressed(ord("F"))) {
    // Apparition de la roue si elle n'est pas visible
    if (!visible) {
        visible = true;
        mouse_pos_x = device_mouse_x_to_gui(0);
        mouse_pos_y = device_mouse_y_to_gui(0);
    }

    // Détermine quel segment est survolé
    var angle_to_mouse = point_direction(mouse_pos_x, mouse_pos_y, device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
    selected_index = floor((angle_to_mouse + angle_offset) / 120) mod 3;

} 

if (keyboard_check_released(ord("F"))) {
    // Disparition de la roue et réinitialisation des variables
    visible = false;
    selected_index = -1;
}
