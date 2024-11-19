/// @description Insert description here

//Collisions
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls_NoWater")];

//Vies
nbViesMax = 3;
nbVies = nbViesMax;
nbVieCent = nbVies/nbViesMax;

Vitesse = 2;

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
Dommages = 12;
AggroRange = 256; //Distance que l'Ennemi vas commencer à chasser l'Avatar
Attack1_Ready = true; //Bite
Attack1_Cooldown = 300;
Attack1_Range = 10;
EnemyTarget = 0;

CanAttack = true;
_Dir = 0;
LastValidDir = 1;
_Xscale = 1;

//FUNCTIONS
//Take Dammage
function fct_Dommages(Dmg){
	if(AvatarState != "Hurt" && AvatarState != "Death"){
		AvatarState = "Hurt";
		sprite_index = Spr_Viper_Hurt;		
		EnemyTarget = Obj_Avatar;
		nbVies -= Dmg;
		if(nbVies <= 0){
			AvatarState = "Death";
			sprite_index = Spr_Viper_Death;		
		}
	}
}