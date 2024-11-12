/// @description Change States
if(AvatarState ="Hurt"){
	AvatarState ="Idle";
	sprite_index = Spr_Avatar_Idle;
	CanMove = true;
	CanAttack = true;
	CanDodge = true;
	alarm_set(6,InvincibleTime);
}

if(AvatarState ="Death"){
	show_message("DEAD!");
	room_restart();
}