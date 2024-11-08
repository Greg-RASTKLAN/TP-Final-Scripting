/// @description Insert description here
// You can write your code in this editor
depth = -y; //Draw order

#region KEYS
_left = keyboard_check(ord("A")) ||  keyboard_check(ord("Q"));
_right = keyboard_check(ord("D"));
_up = keyboard_check(ord("W")) || keyboard_check(ord("Z"));
_down = keyboard_check(ord("S"));
_space = keyboard_check(vk_space);
_mouseclick_left = mouse_check_button(mb_left);
_mouseclick_right = mouse_check_button_released(mb_right);

/*
if (_mouseclick_right){
	switch (EquippedWeapon){
		case "Sword": EquippedWeapon = "Bow"; break;
		case "Bow": EquippedWeapon = "Magic"; break;
		case "Magic": EquippedWeapon = "Sword"; break;
	}
}*/

//DEV
if(keyboard_check_pressed(vk_control)){room_restart();}
#endregion

#region DIRECTION
inputDirection = point_direction(0,0,_right-_left,_down-_up);
if(inputDirection != 0){LastInputDir = inputDirection;}
inputMagnitute = (_right - _left !=0) || (_down - _up !=0);
_Dir = point_direction(x,y,mouse_x,mouse_y);
if(inputDirection == 0){
	direction = _Dir;
} else{direction = LastInputDir;}
#endregion

#region MOUVEMENTS
var _OldSprite = sprite_index;
if(CanMove && AvatarState != "Dodge"){
	if(inputMagnitute != 0){ //WALK
		//X
		//_X = (_right - _left)*Vitesse;
		_X = lengthdir_x(inputMagnitute*Vitesse,inputDirection);
		if(!place_meeting(x+_X, y,_Collisions)){
			x += _X;
		}
		//Y
		//_Y = (_down - _up)*Vitesse;
		_Y = lengthdir_y(inputMagnitute*Vitesse,inputDirection);
		if(!place_meeting(x, y+_Y,_Collisions)){
			y += _Y;
		}
		AvatarState = "Walking"
		sprite_index = Spr_Avatar_Walk;
	} else{
		AvatarState = "Idle"
		sprite_index = Spr_Avatar_Idle;
	}
} else if(DodgeLeft > 0){ //DODGE
	direction = _Dir;
	if(!place_meeting(x+lengthdir_x(DodgeStep, DodgeDirection),y+lengthdir_y(DodgeStep, DodgeDirection),_Collisions)){
		x += lengthdir_x(DodgeStep, DodgeDirection);
		y += lengthdir_y(DodgeStep, DodgeDirection);
	}
	DodgeLeft -= DodgeStep;
	if (DodgeLeft == 0){
		AvatarState = "Idle";
		sprite_index = Spr_Avatar_Idle;
	}
	else if(DodgeLeft < 0){
		DodgeLeft = 0;
		AvatarState = "Idle";
		sprite_index = Spr_Avatar_Idle;
	}
}
#endregion

#region ATTACKS
if(_mouseclick_left && Skill_1_Ready && CanAttack && CanMove && AvatarState != "Dodge"){
	if (EquippedWeapon == "Sword"){ //sword
		direction = _Dir;
		_weapon = instance_create_layer(x,y-24,"Instances",Obj_Sword);
		_weapon.direction = direction;
		//_weapon.image_angle = direction-45;
		Skill_1_Ready = false;
		alarm_set(2,Skill_1_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Sword;
	} else if (EquippedWeapon == "Bow"){ //bow
		direction = _Dir;
		_weapon = instance_create_layer(x,y-16,"Instances",Obj_Arrow);
		_weapon.direction = _Dir;
		_weapon.image_angle = _Dir;
		Skill_1_Ready = false;
		alarm_set(2,Skill_1_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Bow;
	} else if (EquippedWeapon == "Magic"){ //magic
		direction = _Dir;
		_weapon = instance_create_layer(x,y-16,"Instances",Obj_Magic);
		_weapon.direction = direction;
		_weapon.image_angle = direction-45;
		Skill_1_Ready = false;
		alarm_set(2,Skill_1_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Magic;
	}
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

#region Update Animations
if (_OldSprite != sprite_index){LocalFrame = 0;}
Scr_SpriteAnimation();
#endregion

#region POTION COLLISION
var inventory = instance_find(Obj_Inventory, 0);
var potion = instance_place(x, y, Obj_Potion);

if (potion && !inventory.is_full()){
	instance_destroy(potion);
	inventory.pickup(Spr_Potion);
}
#endregion