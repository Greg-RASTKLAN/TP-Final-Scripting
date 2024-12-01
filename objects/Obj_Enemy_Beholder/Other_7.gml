/// @description Insert description here
// You can write your code in this editor
if(AvatarState == "Hurt"){
	AvatarState = "Idle";
	sprite_index = Spr_Beholder_Idle;
	alarm_set(6,InvincibleTime);
}
if(AvatarState == "Death"){
	image_index = image_number-1;
	//instance_destroy();
}