/// @description Simon Paradis
//Ennemi Vipere

//Collisions
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls_NoWater")];

path = path_add();

//Vies
nbViesMax = 3;
nbVies = nbViesMax;
nbVieCent = nbVies/nbViesMax;

Vitesse = 2;

CanMove = true;
StateDelay = 20; //Délai entre les States pour éviter le animation cancel trop tôt
AvatarState = "Idle"; //Idle, Hurt, Death, Walk, etc.

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
		instance_create_layer(x,y-16,"Instances",Obj_BloodVFX);
		AvatarState = "Hurt";
		sprite_index = Spr_Viper_Hurt;		
		EnemyTarget = Obj_Avatar;
		nbVies -= Dmg;
		path_end();
		alarm_set(11,-1);
		if(nbVies <= 0){
			AvatarState = "Death";
			sprite_index = Spr_Viper_Death;		
			audio_sound_set_track_position(snd_SnakeDead, 1.6)
			audio_play_sound(snd_SnakeDead, 0, false)
		}
	}
}