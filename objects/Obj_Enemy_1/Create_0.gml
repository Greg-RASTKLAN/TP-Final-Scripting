/// @description Insert description here
// You can write your code in this editor

nbViesMax = 6;
nbVies = nbViesMax;
nbVieCent = nbVies/nbViesMax;

Vitesse = 1;

CanMove = true;
StateDelay = 20; //Délai entre les States pour éviter le animation cancel trop tôt
AvatarState = "Idle";

//DODGE
DodgeRange = 128;
DodgeLeft = 0;
DodgeStep = 6; //Pixels à bouger chaque frames, vitesse de dodge
DodgeDirection = 0;
CanDodge = true;

//ATTACK
AggroRange = 128;
EnemyTarget = 0;

Bow_AttackSpeed = 30;
CanAttack = true;
_Dir = 0;

function fct_Dommages(Dmg){
	nbVies -= Dmg;
	if(nbVies <= 0){
		instance_destroy();
	}
}