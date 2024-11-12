/// @description Health Bar
hp = Obj_Avatar.nbVies;
hp_max = Obj_Avatar.nbVies_Max

draw_sprite(Spr_HealthBarBackground, 0, healthBar_x, healthBar_y);
draw_sprite_stretched(Spr_Healthbar, 0, healthBar_x, healthBar_y, (hp/hp_max) * healthBar_width, healthBar_height);
draw_sprite(Spr_HealthBarBorder, 0, healthBar_x, healthBar_y);