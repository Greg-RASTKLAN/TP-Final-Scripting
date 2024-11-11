/// @description Insert description here
// You can write your code in this editor
//depth = -16000
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls")];
LastInputDir = 1;

nbVies = 3;
Vitesse = 3;

CanMove = true;
StateDelay = 20; //Délai entre les States pour éviter le animation cancel trop tôt
AvatarState = "Idle";
LocalFrame = 0;

//DODGE
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