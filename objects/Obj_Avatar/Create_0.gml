/// @description Insert description here
// You can write your code in this editor
//depth = -16000
_Collisions = [Obj_Collision,layer_tilemap_get_id("Tiles_Collision")];
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
//bow
Bow_AttackCooldown = 30;
//sword
Sword_AttackCooldown = 45;