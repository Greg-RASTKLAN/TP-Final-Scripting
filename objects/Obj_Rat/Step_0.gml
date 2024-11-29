/// @description
depth = -y; //Draw order

if (distance_to_object(Obj_Avatar) <= AggroRange){ //s'enfuit de l'Avatar
	AvatarState = "RunAway";
	sprite_index = Spr_Rat_Walk;
	direction = point_direction(self.x,self.y,EnemyTarget.x,EnemyTarget.y)-180;
	
	//Movements And Collisions
	/*_X = lengthdir_x(Vitesse,direction);
	if(!place_meeting(x+_X, y,_Collisions)){
		x += _X;
	}
	_Y = lengthdir_y(Vitesse,direction);
	if(!place_meeting(x, y+_Y,_Collisions)){
		y += _Y;
	}*/
	_Xscale = sign(round(x-xprevious));
	if(_Xscale == 0){_Xscale = -1;}
	image_xscale = _Xscale;
	
	if(alarm_get(11) <= 0){alarm_set(11, 30);}
} else{ //Idle
	AvatarState = "Idle";
	sprite_index = Spr_Rat_Idle;
	path_end();
	alarm_set(11,-1);
}