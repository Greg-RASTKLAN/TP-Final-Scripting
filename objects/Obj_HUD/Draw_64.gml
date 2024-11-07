
view_width = camera_get_view_width(0);
view_height = camera_get_view_height(0);

// Arriere plan du HUD
draw_sprite_stretched(Spr_Skills_Back, 0,  view_width/2 - (view_width/3)/2, view_height - 150, view_width/3, 150);

// Compétences
draw_sprite(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 20, view_height - 140);
draw_sprite(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 110, view_height - 140);
draw_sprite(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 200, view_height - 140);

// Arme courante affichée sur la gauche du HUD
//draw_sprite(Spr_Sword_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
//show_debug_message(currentWeapon)

if(currentWeapon == "Sword")
	draw_sprite(Spr_Sword_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
	
if(currentWeapon == "Bow")
	draw_sprite(Spr_Bow_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
	
//if(currentWeapon == "Magic")
//	draw_sprite(Spr_Magic_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);

// Affichage du cooldown sous forme de chiffres
var display_x =  view_width/2 - (view_width/3)/2 + 80;  // Position X de l'affichage
var display_y =  view_height - 100;  // Position Y de l'affichage

// Cooldown
draw_set_color(c_white);  
draw_text(display_x, display_y, string(ceil(cooldown_timer)));














