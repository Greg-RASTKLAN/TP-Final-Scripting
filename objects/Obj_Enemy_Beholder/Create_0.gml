/// @description Insert description here

//Collisions
_Collisions = [Obj_Collision,layer_tilemap_get_id("FrontWalls_NoWater")];

//Vies
nbViesMax = 60;
nbVies = nbViesMax;
nbVieCent = nbVies/nbViesMax;

//Mouvements
LocalFrame = 0;
Vitesse = 0.5;
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
AggroRange = 256; //Distance que l'Ennemi vas commencer à chasser l'Avatar
//Beam
Attack1_Ready = true;
Attack1_Cooldown = 300;
Attack1_Range = 100;
//BulletHell
nbBullets = 12;
BulletHellDuration = 240;
BulletHellStep = 0;
Attack2_Ready = true;
Attack2_Cooldown = 600;
//Spin
DommagesSpin = 10;
Attack2_Range = 10;
EnemyTarget = 0;

CanAttack = true;
_Dir = 0;
_Xscale = 1;

//FUNCTIONS
//Take Dammage
function fct_Dommages(Dmg){
	if(AvatarState != "Hurt" && AvatarState != "Death"){
		instance_create_layer(x,y-16,"Instances",Obj_BloodVFX);
		AvatarState = "Hurt";
		sprite_index = Spr_Beholder_Hurt;		
		EnemyTarget = Obj_Avatar;
		nbVies -= Dmg;
		if(nbVies <= 0){
			AvatarState = "Death";
			sprite_index = Spr_Beholder_Death;	
			audio_play_sound(snd_behholderDeath, 0, false);
			audio_play_sound(snd_victory, 0, false);
			
		}
	}
}