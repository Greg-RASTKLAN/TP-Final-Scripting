/// @description Insert description here
// You can write your code in this editor
if(AvatarState == "Hurt"){
	AvatarState = "Idle";
}
if(AvatarState == "Death"){
	instance_destroy();
}