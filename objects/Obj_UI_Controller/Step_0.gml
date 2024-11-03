/// @description Input Weapon Wheel


if (keyboard_check_pressed(ord("F"))) {
    show_weapon_wheel = true;
	wheel_x = device_mouse_x_to_gui(0); // Stocke la position X de la souris
    wheel_y = device_mouse_y_to_gui(0); // Stocke la position Y de la souris
}
if (keyboard_check_released(ord("F"))) {
    show_weapon_wheel = false;
}
