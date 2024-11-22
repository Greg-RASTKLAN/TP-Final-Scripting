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
_keyE = keyboard_check(ord("E"));
_keyR = keyboard_check(ord("R"));
keyInteract = keyboard_check(ord("F")) || keyboard_check(ord("B"));
keyPotionHP =  keyboard_check(ord("1"));
keyPotionMP =  keyboard_check(ord("2"));

//DEV
/*if (_mouseclick_right){
	switch (EquippedWeapon){
		case "Sword": EquippedWeapon = "Bow"; break;
		case "Bow": EquippedWeapon = "Magic"; break;
		case "Magic": EquippedWeapon = "Sword"; break;
	}
}*/

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
if(AvatarState != "Hurt" && AvatarState != "Death"){
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
}
#endregion

#region ATTACKS Skill 1
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
		audio_play_sound(snd_SwordImpactAutoAttack, 0, false);
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

#region ATTACKS Skill 2
if(_keyE && Skill_2_Ready && CanAttack && CanMove && AvatarState != "Dodge" && nbMana >= Skill_2_Mana){
	nbMana -= Skill_2_Mana;
	if (EquippedWeapon == "Sword"){ //sword
		direction = _Dir;
		_weapon = instance_create_layer(x,y-24,"Instances",Obj_Sword);
		_weapon.direction = direction;
		_weapon = instance_create_layer(x,y-24,"Instances",Obj_Sword_Lacerate);
		_weapon.direction = direction;
		//_weapon.image_angle = direction-45;
		Skill_2_Ready = false;
		alarm_set(3,Skill_2_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Sword;
	} else if (EquippedWeapon == "Bow"){ //bow Skill 2 (Extra Arrows)
		direction = _Dir;
		_weapon = instance_create_layer(x,y-16,"Instances",Obj_Arrow);
		_weapon.direction = _Dir;
		_weapon.image_angle = _Dir;
		_weapon = instance_create_layer(x,y-16,"Instances",Obj_Arrow);
		_weapon.direction = _Dir+10;
		_weapon.image_angle = _Dir;
		_weapon = instance_create_layer(x,y-16,"Instances",Obj_Arrow);
		_weapon.direction = _Dir-10;
		_weapon.image_angle = _Dir;
		Skill_2_Ready = false;
		alarm_set(3,Skill_2_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Bow;
	} else if (EquippedWeapon == "Magic"){ //magic
		direction = _Dir;
		_weapon = instance_create_layer(x,y-16,"Instances",Obj_Magic_Napalm);
		_weapon.direction = direction;
		_weapon.image_angle = direction-45;
		Skill_2_Ready = false;
		alarm_set(3,Skill_2_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Magic;
	}
}
#endregion

#region ATTACKS Skill 3
if(_keyR && Skill_3_Ready && CanAttack && CanMove && AvatarState != "Dodge" && nbMana >= Skill_3_Mana){	
	nbMana -= Skill_3_Mana;
	if (EquippedWeapon == "Sword"){ //sword
		direction = _Dir;
		for (var i=0;i<=2;i++){
			_weapon = instance_create_layer(x+lengthdir_x(30,direction+i*120),y-16+lengthdir_y(30,direction+i*120),"Instances",Obj_Sword_Skill3);
			_weapon.direction = direction+i*120;
			_weapon.image_angle = direction-45+i*120;
		}
		Skill_3_Ready = false;
		alarm_set(4,Skill_3_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Sword;
	} else if (EquippedWeapon == "Bow"){ //bow Skill 3 (Extra Arrows)
		direction = _Dir;
		_weapon = instance_create_layer(x,y-16,"Instances",Obj_Arrow_Pierce);
		_weapon.direction = _Dir;
		_weapon.image_angle = _Dir;
		Skill_3_Ready = false;
		alarm_set(4,Skill_3_Cooldown);
		CanMove = false;
		alarm_set(1,StateDelay);
		AvatarState = "Attack";
		sprite_index = Spr_Avatar_Bow;
	} else if (EquippedWeapon == "Magic"){ //magic
		direction = _Dir;
		for (var i=0;i<=7;i++){
			_weapon = instance_create_layer(x,y-16,"Instances",Obj_Magic);
			_weapon.direction = direction+i*45;
			_weapon.image_angle = direction-45+i*45;
		}
		Skill_3_Ready = false;
		alarm_set(4,Skill_3_Cooldown);
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
	CanDodge = false;
	alarm_set(5,DodgeCooldown);
}
#endregion

#region Update Animations
if (_OldSprite != sprite_index){LocalFrame = 0;}
if(AvatarState != "Hurt" && AvatarState != "Death"){
	Scr_SpriteAnimation();
}
#endregion

#region POTION COLLISION
var ItemPotionHP = instance_place(x, y, Obj_PotionHP);
var ItemPotionMP = instance_place(x, y, Obj_PotionMP);


if (ItemPotionHP && PotionHP < PotionHP_Max){
	PotionHP++;
	instance_destroy(ItemPotionHP);
}
if (ItemPotionMP && PotionMP < PotionMP_Max){
	PotionMP++;
	instance_destroy(ItemPotionMP);
}

#endregion

#region HEALTH REGEN
if nbVies < nbVies_Max{
	if (keyPotionHP && PotionHP > 0) {
		nbVies += hpPotion;
		PotionHP--;
		nbVies = clamp(nbVies,0,nbVies_Max);
	}	
}
#endregion

#region MANA REGEN
if nbMana < nbMana_Max{
	nbMana += ManaRegen;
	
	if (keyPotionMP && PotionMP > 0) {
		nbMana += ManaPotion;
		PotionMP--;
		nbMana = clamp(nbMana,0,nbMana_Max);
	}
}
#endregion

#region NPC Dialogs
Obj_NPC.image_index = 0
if(place_meeting(x, y, Obj_NPC)) {
	Obj_NPC.image_index = 1;
	if(keyInteract){
		showDialog = true;
	}
} else {
	showDialog = false;
}
#endregion

#region INTERACT CHEST
if (keyInteract){
	chest = instance_nearest(x,y,Obj_Chest);
	if distance_to_object(chest) < 30 && chest.opened == false{
		chest.Fct_OpenChest();
	}
}
#endregion

if(AvatarState == "Death" && keyboard_check_pressed(vk_anykey))
{ 
	room_restart();
}