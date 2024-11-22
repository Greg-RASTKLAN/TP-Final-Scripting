/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_BackgroundWater, 0, true);

if(room == rm_Menui)	
	{audio_play_sound(snd_MainMenu, 0, false);}
	
//Hide collisions layer
layer_set_visible(layer_get_id("Ins_Collisions"), false);