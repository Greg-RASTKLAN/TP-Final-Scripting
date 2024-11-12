/// @description Insert description here
// You can write your code in this editor

#region ATTACK
if(AvatarState != "Hurt" && AvatarState != "Death"){
	if (Attack1_Ready && distance_to_object(Obj_Avatar) <= Attack1_Range 
	&& distance_to_object(Obj_Avatar) > Attack2_Range){ //Throw Acid
		AvatarState = "Attack";
		sprite_index = Spr_MutantRat_Attack1;
		Attack1_Ready = false;
		alarm_set(2,Attack1_Cooldown);
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		_Acid = instance_create_layer(x,y-16,"Instances",Obj_Enemy_AcidBlob);
		_Acid.Target_X = Obj_Avatar.x;
		_Acid.Target_Y = Obj_Avatar.y;
		_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;
	} else if (distance_to_object(Obj_Avatar) <= Attack2_Range){ //Slash
		AvatarState = "Attack";
		sprite_index = Spr_MutantRat_Attack2;
		Attack2_Ready = false;
		alarm_set(3,Attack2_Cooldown);
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;
		Obj_Avatar.fct_Dommages(Dommages);
	} else if (distance_to_object(Obj_Avatar) <= AggroRange){ //Move to Avatar
		AvatarState = "Walk"
		sprite_index = Spr_MutantRat_Walk;
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		//Movements And Collisions
		_X = lengthdir_x(Vitesse,direction);
		if(!place_meeting(x+_X, y,_Collisions)){
			x += _X;
		}
		_Y = lengthdir_y(Vitesse,direction);
		if(!place_meeting(x, y+_Y,_Collisions)){
			y += _Y;
		}
		_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;
	} else{ //Idle
		AvatarState = "Idle";
		sprite_index = Spr_MutantRat_idle;
		EnemyTarget = 0;
	}
}
#endregion

/*/
#region MOUVEMENTS
if(CanMove && AvatarState != "Dodge"){
	if(_left || _right || _up || _down){
		x += (_right - _left)*Vitesse;
		y += (_down - _up)*Vitesse;
		AvatarState = "Walking"
		sprite_index = Spr_Avatar_Walk;
	} else{
		AvatarState = "Idle"
		sprite_index = Spr_Avatar_Idle;
	}
} else if(DodgeLeft > 0){
	x += lengthdir_x(DodgeStep, DodgeDirection);
	y += lengthdir_y(DodgeStep, DodgeDirection);
	DodgeLeft -= DodgeStep;
	if (DodgeLeft == 0){AvatarState = "Idle";}
	else if(DodgeLeft < 0){
		DodgeLeft = 0;
		AvatarState = "Idle";
		sprite_index = Spr_Avatar_Idle;
	}
}
#endregion
/*/

/*/
#region ATTACK
if(CanAttack && CanMove && AvatarState != "Dodge"){
	_weapon = instance_create_layer(x,y,"Instances",Obj_weapon);
	_weapon.direction = direction;
	_weapon.image_angle = direction;
	CanAttack = false;
	alarm_set(0,Bow_AttackCooldown);
	CanMove = false;
	alarm_set(1,StateDelay);
	AvatarState = "Attack";
	sprite_index = Spr_Avatar_Arc;
}
#endregion

#region DODGE
if(CanMove && AvatarState != "Dodge" && CanDodge){
	AvatarState = "Dodge";
	sprite_index = Spr_Avatar_Dodge;
	DodgeLeft = DodgeRange;
	DodgeDirection = _Dir;
	CanAttack = false;
	alarm_set(0,StateDelay);
}
#endregion
/*/