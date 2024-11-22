/// @description Simon Paradis
// Rat décoratif

//Collision utilisés pour le mouvements
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls_NoWater")];

//Vies
nbViesMax = 3;
nbVies = nbViesMax;

AggroRange = 128; //Distance que le Rat s'enfui de l'Avatar
EnemyTarget = Obj_Avatar;

Vitesse = 2;
AvatarState = "Idle"; //Idle, Hurt, Death, Walk, etc.
LastValidDir = 1;
_Xscale = 1;