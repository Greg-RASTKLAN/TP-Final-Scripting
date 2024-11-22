//Simon Paradis
//Script pour Animer un Sprite avec 4 directions Cardinales
//Ordre : HAUT, GAUCHE, BAS, DROITE
//Ajouter LocalFrame = 0; dans le Create de chaque Obj utilisant le Script
//le script peut retourner un Bool pour savoir si une anim est finie == True

function Scr_SpriteAnimation(){
	var _CardinalDirection = round(direction/90)-1; //floor(((direction / 45)-2)*0.5);
	var _TotalFrames = sprite_get_number(sprite_index)/4;
	image_index = LocalFrame + (_CardinalDirection*_TotalFrames);
	LocalFrame += sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps);
	
	//LOOP Anim si à la fin et retourne True si finie, False sinon
	if(LocalFrame >= _TotalFrames){
		LocalFrame -= _TotalFrames;
		return true;
	} else{
		return false;
	}
}