/// @description Affichage HUD
/*
#region BACKGROUND HUD - SKILLS
// Définir la transparence et la couleur
draw_set_alpha(0.5);
draw_set_color(c_blue);

// Définir des dimensions fixes pour le rectangle
var rect_width = 300; 
var rect_height = 100; 

// Calculer la position pour centrer le rectangle en bas
var rect_x = (room_width - rect_width) / 2; 
var rect_y = room_height - rect_height; 

// Dessiner le rectangle
draw_rectangle(rect_x, rect_y, rect_x + rect_width, room_height, false);
draw_set_alpha(1);
#endregion

#region SKILLS SLOTS
// SKILL 1 - AUTO ATTAQUE
draw_sprite(Spr_SkillSlot, 0, rect_x + 50, rect_y + 20);

// SKILL 2
draw_sprite(Spr_SkillSlot, 0, rect_x + 130, rect_y + 20);

// SKILL 3
draw_sprite(Spr_SkillSlot, 0, rect_x + 210, rect_y + 20);
#endregion

#region BACKGROUND HUD - POTIONS
draw_set_alpha(0.5);
draw_set_color(c_red);

// Dimensions pour le deuxième rectangle
var rect2_width = rect_width / 2;
var rect2_height = rect_height;

// Position pour le deuxième rectangle
var rect2_x = rect_x + rect_width + 20; 
var rect2_y = rect_y;

draw_rectangle(rect2_x, rect2_y, rect2_x + rect2_width, rect2_y + rect2_height, false);
draw_set_alpha(1);
#endregion

#region POTIONS SLOTS
// POTION 1 - HP
var scale_factor = 0.5; // Réduire la taille à 50%
draw_sprite(Spr_SkillSlot, 0, rect_x + 325, rect_y + 20);
draw_sprite_ext(Spr_Potion, 0, rect_x + 325, rect_y + 20, scale_factor, scale_factor, 0, c_white, 1);


// POTION 2 - MANA
draw_sprite(Spr_SkillSlot, 0, rect_x + 400, rect_y + 20);
draw_sprite_ext(Spr_Mana, 0, rect_x + 400, rect_y + 20, scale_factor, scale_factor, 0, c_white, 1);
#endregion

// Dessine l'arme courante du personnage sur la gauche de l'HUD
var scale_factor = 5;
var angle = -90; 

// Dessiner le sprite avec mise à l'échelle et rotation
draw_sprite_ext(Spr_Sword, 0, rect_x, rect_y, scale_factor, scale_factor, angle, c_white, 1);


*/