// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_SpriteAnimation(){
	
	var _CardinalDirection = round(direction/90)-1; //floor(((direction / 45)-2)*0.5);
	var _TotalFrames = sprite_get_number(sprite_index)/4;
	image_index = LocalFrame + (_CardinalDirection*_TotalFrames);
	LocalFrame += sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps);
	
	//LOOP Anim si à la fin
	if(LocalFrame >= _TotalFrames){
		LocalFrame -= _TotalFrames;
		return true;
	} else{
		return false;
	}
}