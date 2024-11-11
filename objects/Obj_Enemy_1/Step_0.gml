/// @description Insert description here
// You can write your code in this editor

#region AGGRO
if(AvatarState != "Hurt" && AvatarState != "Death"){
	if (Attack1_Ready && distance_to_object(Obj_Avatar) <= Attack1_Range 
	&& distance_to_object(Obj_Avatar) > Attack2_Range){
		AvatarState = "Attack";
		sprite_index = Spr_MutantRat_Attack1;
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;
		
	} else if (distance_to_object(Obj_Avatar) <= Attack2_Range){
		AvatarState = "Attack";
		sprite_index = Spr_MutantRat_Attack2;
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;
	} else if (distance_to_object(Obj_Avatar) <= AggroRange){
		AvatarState = "Walk"
		sprite_index = Spr_MutantRat_Walk;
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		x += lengthdir_x(Vitesse,direction);
		y += lengthdir_y(Vitesse,direction);
		_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;
	} else{
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