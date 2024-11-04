if (visible) {
    draw_set_alpha(0.7);

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

    // Remet la transparence par défaut
    draw_set_alpha(1);
}
