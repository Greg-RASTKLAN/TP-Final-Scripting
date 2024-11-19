/// @description Insert description here

//Collisions
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls_NoWater")];

//Vies
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
Dommages = 10;
AggroRange = 256; //Distance que l'Ennemi vas commencer à chasser l'Avatar
Attack1_Ready = true;
Attack1_Cooldown = 300;
Attack1_Range = 100; //Acid Blob
Attack2_Ready = true;
Attack2_Cooldown = 300;
Attack2_Range = 10; //Slash
EnemyTarget = 0;

Bow_AttackCooldown = 30;
CanAttack = true;
_Dir = 0;
_Xscale = 1;

//FUNCTIONS
//Take Dammage
function fct_Dommages(Dmg){
	if(AvatarState != "Hurt" && AvatarState != "Death"){
		AvatarState = "Hurt";
		sprite_index = Spr_MutantRat_Hurt;		
		EnemyTarget = Obj_Avatar;
		nbVies -= Dmg;
		if(nbVies <= 0){
			AvatarState = "Death";
			sprite_index = Spr_MutantRat_Death;		
		}
	}
}