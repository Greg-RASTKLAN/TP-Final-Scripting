/// @description Mana Bar

mana = Obj_Avatar.nbMana;
mana_max = Obj_Avatar.nbMana_Max;

draw_sprite(Spr_ManaBarBackground, 0, manaBar_x, manaBar_y);
draw_sprite_stretched(Spr_ManaBar, 0, manaBar_x, manaBar_y, (mana/mana_max) * manaBar_width, manaBar_height);
draw_sprite(Spr_ManaBarBorder, 0, manaBar_x, manaBar_y);