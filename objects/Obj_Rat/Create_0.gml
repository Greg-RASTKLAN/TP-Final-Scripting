/// @description Simon Paradis
// Rat décoratif

//Collision utilisés pour le mouvements
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls_NoWater")];

path = path_add();

//Vies
nbViesMax = 3;
nbVies = nbViesMax;

AggroRange = 128;//+irandom_range(-64,64); //Distance que le Rat s'enfui de l'Avatar
EnemyTarget = Obj_Avatar;

Vitesse = 2;//+irandom_range(-1,1);
AvatarState = "Idle"; //Idle, Hurt, Death, Walk, etc.
LastValidDir = 1;
_Xscale = 1;