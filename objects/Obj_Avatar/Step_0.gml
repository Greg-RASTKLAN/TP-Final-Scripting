/// @description Insert description here
// You can write your code in this editor

#region KEYS
_left = keyboard_check(ord("A"));
_right = keyboard_check(ord("D"));
_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));
_space = keyboard_check(vk_space);
_mouseclick_left = mouse_check_button(mb_left);

//DEV
if(keyboard_check_pressed(vk_control)){room_restart();}
#endregion

#region DIRECTION
_Dir = point_direction(x,y,mouse_x,mouse_y);
direction = _Dir;
#endregion

#region MOUVEMENTS
if(CanMove && AvatarState != "Dodge"){
	if(_left || _right || _up || _down){ //WALK
		//X
		_X = (_right - _left)*Vitesse;
		if(!place_meeting(x+_X, y,Obj_Collision)){
			x += _X;
		}
		//Y
		_Y = (_down - _up)*Vitesse;
		if(!place_meeting(x, y+_Y,Obj_Collision)){
			y += _Y;
		}
		AvatarState = "Walking"
		sprite_index = Spr_Avatar_Walk;
	} else{
		AvatarState = "Idle"
		sprite_index = Spr_Avatar_Idle;
	}
} else if(DodgeLeft > 0){ //DODGE
	if(!place_meeting(x+lengthdir_x(DodgeStep, DodgeDirection),y+lengthdir_y(DodgeStep, DodgeDirection),Obj_Collision)){
		x += lengthdir_x(DodgeStep, DodgeDirection);
		y += lengthdir_y(DodgeStep, DodgeDirection);
	}
	DodgeLeft -= DodgeStep;
	if (DodgeLeft == 0){AvatarState = "Idle";}
	else if(DodgeLeft < 0){
		DodgeLeft = 0;
		AvatarState = "Idle";
		sprite_index = Spr_Avatar_Idle;
	}
}
#endregion

#region ATTACK
if(_mouseclick_left && CanAttack && CanMove && AvatarState != "Dodge"){
	_arrow = instance_create_layer(x,y,"Instances",Obj_Arrow);
	_arrow.direction = direction;
	_arrow.image_angle = direction;
	CanAttack = false;
	alarm_set(0,Arc_VitesseDeTir);
	CanMove = false;
	alarm_set(1,StateDelay);
	AvatarState = "Attack";
	sprite_index = Spr_Avatar_Arc;
}
#endregion

#region DODGE
if(CanMove && _space && AvatarState != "Dodge" && CanDodge){
	AvatarState = "Dodge";
	sprite_index = Spr_Avatar_Dodge;
	DodgeLeft = DodgeRange;
	DodgeDirection = _Dir;
	CanAttack = false;
	alarm_set(0,StateDelay);
}
#endregion