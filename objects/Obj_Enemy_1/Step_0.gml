/// @description Insert description here
// You can write your code in this editor

#region AGGRO
if(AvatarState != "Hurt" && AvatarState != "Death"){
	if distance_to_object(Obj_Avatar) <= AggroRange{
		sprite_index = Spr_MutantRat_Walk;
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		if(direction < 90 && direction > 270){image_xscale = 1;} else{image_xscale = -1;} //Flip Sprite
		move_towards_point(Obj_Avatar.x,Obj_Avatar.y,Vitesse);
	} else{
		sprite_index = Spr_MutantRat_idle;
		EnemyTarget = 0;
		move_towards_point(x,y,0);
	}
} else{
	move_towards_point(x,y,0);
}
#endregion

#region DIRECTION

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