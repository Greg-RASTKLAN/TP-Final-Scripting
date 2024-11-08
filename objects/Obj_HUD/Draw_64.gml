/// @description Affichage du HUD

view_width = camera_get_view_width(0);
view_height = camera_get_view_height(0);

// Arriere plan du HUD
draw_sprite_stretched(Spr_Skills_Back, 0,  view_width/2 - (view_width/3)/2, view_height - 150, view_width/3, 150);

// Compétences
draw_sprite(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 20, view_height - 140);
draw_sprite(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 110, view_height - 140);
draw_sprite(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 200, view_height - 140);

show_debug_message(currentWeapon)
#region Arme courante sur la gauche du HUD
if(currentWeapon == "Sword")
	draw_sprite(Spr_Sword_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
	
if(currentWeapon == "Bow")
	draw_sprite(Spr_Bow_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
	
//if(currentWeapon == "Magic")
//	draw_sprite(Spr_Magic_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
#endregion

#region Cooldown
// Affichage du cooldown sous forme de chiffres
var display_x =  view_width/2 - (view_width/3)/2 + 80;
var display_y =  view_height - 100; 

// Cooldown Skill 1
var time_left_s1 = floor(timer_s1 / room_speed);
draw_text(display_x , display_y, string(time_left_s1));   

// Cooldown Skill 2
var time_left_s2 = floor(timer_s2 / room_speed);
draw_text(display_x + 90, display_y, string(time_left_s2));     

// Cooldown Skill 3
var time_left_s3 = floor(timer_s3 / room_speed);
draw_text(display_x + 180, display_y, string(time_left_s3));      
#endregion











