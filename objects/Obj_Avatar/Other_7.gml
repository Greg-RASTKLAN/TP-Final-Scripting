/// @description Insert description here
// You can write your code in this editor
if(AvatarState ="Hurt"){
	AvatarState ="Idle";
	sprite_index = Spr_Avatar_Idle;
}

if(AvatarState ="Death"){
	room_restart();
}