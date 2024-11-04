/// @description Weapon Wheel

if (show_weapon_wheel) {
    var cx = wheel_x;
    var cy = wheel_y;
    var radius = 100;
    var angle_step = 120;
    
    // Initialiser les variables pour le segment survolé
    var hovered_segment = -1;

    // Déterminer quel segment est survolé par la souris
    var mouse_angle = point_direction(cx, cy, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
    for (var i = 0; i < 3; i++) {
        var start_angle = i * angle_step - 90;
        var end_angle = (i + 1) * angle_step - 90;
        if (mouse_angle >= start_angle && mouse_angle < end_angle) {
            hovered_segment = i; // Le segment survolé est trouvé
        }
    }
	
    draw_set_alpha(0.5);

    // Dessiner le cercle transparent et les lignes de division
    draw_circle(cx, cy, radius, false);
    for (var i = 0; i < 3; i++) {
        var line_x = cx + lengthdir_x(radius, i * angle_step - 90);
        var line_y = cy + lengthdir_y(radius, i * angle_step - 90);
        draw_line(cx, cy, line_x, line_y);
        
        // Surbrillance du segment survolé
        if (i == hovered_segment) {
            draw_set_color(c_yellow);
            draw_triangle(cx, cy, line_x, line_y, cx + lengthdir_x(radius, (i + 1) * angle_step - 90), cy + lengthdir_y(radius, (i + 1) * angle_step - 90), false);
            draw_set_color(c_white);
        }
    }
	
    draw_set_alpha(1);

    // Dessiner les sprites des armes au-dessus de la wheel
    var weapon_sprites = [Spr_Sword, Spr_Sword, Spr_Sword];
    for (var i = 0; i < 3; i++) {
        var wx = cx + lengthdir_x(radius * 0.7, i * angle_step - 145);
        var wy = cy + lengthdir_y(radius * 0.7, i * angle_step - 145);
        draw_sprite_ext(weapon_sprites[i], 0, wx, wy, 1, 1, 0, c_white, 1);
    }
}


