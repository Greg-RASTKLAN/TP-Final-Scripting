/// @description Affichage du HUD

view_width = camera_get_view_width(0);
view_height = camera_get_view_height(0);

// Arriere plan du HUD Skills
draw_sprite_stretched(Spr_Skills_Back, 0,  view_width/2 - (view_width/3)/2, view_height - 150, view_width/3, 150);
//show_debug_message(image_index)
#region Affichage des skills selon l'arme courante
// Compétences Sword
if(currentWeapon == "Sword") {
	var c = (Obj_Avatar.Skill_1_Ready ? draw_sprite_ext(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 25, view_height - 120,1,1,0,c_white,1) : draw_sprite_ext(Spr_Skill1, 0, view_width/2 - (view_width/3)/2 + 25, view_height - 120,1,1,0,c_gray,1))
	var c = (Obj_Avatar.Skill_2_Ready ? draw_sprite(Spr_Skill2, 0, view_width/2 - (view_width/3)/2 + 125, view_height - 120): draw_sprite_ext(Spr_Skill2, 0, view_width/2 - (view_width/3)/2 + 125, view_height - 120,1,1,0,c_gray,1));
	var c = (Obj_Avatar.Skill_3_Ready ? draw_sprite(Spr_Skill3, 0, view_width/2 - (view_width/3)/2 + 225, view_height - 120): draw_sprite_ext(Spr_Skill3, 0, view_width/2 - (view_width/3)/2 + 225, view_height - 120,1,1,0,c_gray,1));
}

// Compétences Bow
if(currentWeapon == "Bow") {
	c = (Obj_Avatar.Skill_1_Ready ? draw_sprite(Spr_Skill1, 1, view_width/2 - (view_width/3)/2 + 25, view_height - 120) : draw_sprite_ext(Spr_Skill1, 1, view_width/2 - (view_width/3)/2 + 25, view_height - 120,1,1,0,c_gray,1));
	draw_sprite(Spr_Skill2, 1, view_width/2 - (view_width/3)/2 + 125, view_height - 120);
	draw_sprite(Spr_Skill3, 1, view_width/2 - (view_width/3)/2 + 225, view_height - 120);
}

// Compétences Magic
if(currentWeapon == "Magic") {
	draw_sprite(Spr_Skill1, 2, view_width/2 - (view_width/3)/2 + 25, view_height - 120);
	draw_sprite(Spr_Skill2, 2, view_width/2 - (view_width/3)/2 + 125, view_height - 120);
	draw_sprite(Spr_Skill3, 2, view_width/2 - (view_width/3)/2 + 225, view_height - 120);
}
#endregion

//show_debug_message(currentWeapon)
#region Arme courante sur la gauche du HUD
if(currentWeapon == "Sword")
	draw_sprite(Spr_Sword_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
	
if(currentWeapon == "Bow")
	draw_sprite(Spr_Bow_Statique, 1, view_width/2 - (view_width/3)/2 - 40, view_height - 226);
	
if(currentWeapon == "Magic") 
    draw_sprite_ext(Spr_Magic_Statique, 1, view_width / 2 - (view_width / 3) / 2 - 110, view_height - 30, 1 / 3, 1 / 3, 25, c_white, 1);
#endregion


// Arriere plan du HUD Potion
draw_sprite_stretched(Spr_Skills_Back, 0,  view_width/2 - (view_width/3)/2 + 350, view_height - 100, view_width/6, 100);

// Potions
draw_sprite(Spr_PotionHP, 0, view_width/2 - (view_width/3)/2 + 350, view_height - 100); // Potion
draw_text(view_width/2 - (view_width/3)/2 + 350, view_height - 100,string(Obj_Avatar.PotionHP));

draw_line_width_color(view_width/2 - (view_width/3)/2 + 430, 
						view_height - 75, 
						view_width/2 - (view_width/3)/2 + 430, 
						view_height - 25, 
						2, // Largeur de la ligne
						#F5C400, 
						#CA9822);
						  
draw_sprite(Spr_PotionMana, 0, view_width/2 - (view_width/3)/2 + 420, view_height - 100); // Mana