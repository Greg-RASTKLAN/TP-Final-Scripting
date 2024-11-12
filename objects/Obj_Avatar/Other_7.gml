/// @description Change States
if(AvatarState ="Hurt"){
	AvatarState ="Idle";
	sprite_index = Spr_Avatar_Idle;
	CanMove = true;
	CanAttack = true;
	CanDodge = true;
}

if(AvatarState ="Death"){
	show_message("DEAD!");
	room_restart();
}