/// @description Insert description here
// You can write your code in this editor
//depth = -16000
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls")];
LastInputDir = 1;


nbVies_Max = 50;
nbVies = nbVies_Max;
Vitesse = 3;

CanMove = true;
StateDelay = 20; //Délai entre les States pour éviter le animation cancel trop tôt
AvatarState = "Idle";
LocalFrame = 0;

//DODGE
DodgeCooldown = 80;
DodgeRange = 128;
DodgeLeft = 0;
DodgeStep = 6; //Pixels à bouger chaque frames, vitesse de dodge
DodgeDirection = 0;
CanDodge = true;

//ATTACK
//WeaponsAvailable = ["Sword", "Bow", "Magic"];
EquippedWeapon = "Sword";
CanAttack = true;
_Dir = 0;

//Skills Cooldowns
Skill_1_Cooldown = 60;
Skill_2_Cooldown = 120;
Skill_3_Cooldown = 360;
Skill_1_Ready = false;
Skill_2_Ready = false;
Skill_3_Ready = false;
alarm_set(2,Skill_1_Cooldown);
alarm_set(3,Skill_2_Cooldown);
alarm_set(4,Skill_3_Cooldown);

//bow
Bow_AttackCooldown = 30;
//sword
Sword_AttackCooldown = 45;

//FUNCTIONS
function fct_Dommages(Dmg){
	if(AvatarState != "Hurt" && AvatarState != "Death" && AvatarState != "Dodge"){
		AvatarState = "Hurt";
		sprite_index = Spr_Avatar_Hurt;
		CanAttack = false;
		CanMove = false;
		CanDodge = false;
		nbVies -= Dmg;
		if(nbVies <= 0){
			AvatarState = "Death";
			sprite_index = Spr_Avatar_Death;
			CanMove = false;
		}
	}
}