/// @description Insert description here
// You can write your code in this editor

draw_sprite(Spr_Shadow,0,floor(x),floor(y)); //Ombre sous l'Avatar
draw_self();

draw_text(floor(x),floor(y)-64,string(DodgeLeft)+"   "+AvatarState);