/// @description Simon Paradis
//Player Character

//Collision utilisés pour le mouvement seulement, pas pour les attaques
_Collisions = [Obj_Collision,layer_tilemap_get_id("Front_Walls_NoWater")];
LastInputDir = 1;

Invincible = false;
InvincibleTime = 30; //Temps Invinciple après l'animation Hurt pour éviter StunLock

//HP
nbVies_Max = 100;
nbVies = nbVies_Max;
hpPotion = 30; //nombre de HP et MP reçus en utilisant les potions
PotionHP = 1; //Nombre de Potions HP
PotionHP_Max = 3;
PotionMP = 1; //Nombre de Potions MP
PotionMP_Max = 3;

//MP
nbMana_Max = 100;
nbMana = nbMana_Max;
ManaRegen = 0.1;
ManaPotion = 30

//Mouvements et States
Vitesse = 3;
CanMove = true;
StateDelay = 20; //Délai entre les States pour éviter le animation cancel trop tôt
AvatarState = "Idle"; //Idle, Hurt, Death, Walk, etc.
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

//Skills 1-3 Cooldowns
Skill_1_Cooldown = 60;
Skill_2_Cooldown = 120;
Skill_3_Cooldown = 300;
Skill_1_Ready = true;
Skill_2_Ready = true;
Skill_3_Ready = true;
Skill_2_Mana = 30;
Skill_3_Mana = 60;
alarm_set(2,Skill_1_Cooldown);
alarm_set(3,Skill_2_Cooldown);
alarm_set(4,Skill_3_Cooldown);

//FUNCTIONS
function fct_Dommages(Dmg){
	if(AvatarState != "Hurt" && AvatarState != "Death" && AvatarState != "Dodge" && !Invincible){
		AvatarState = "Hurt";
		sprite_index = Spr_Avatar_Hurt;
		CanAttack = false;
		CanMove = false;
		CanDodge = false;
		Invincible = true;
		nbVies -= Dmg;
		if(nbVies <= 0){
			AvatarState = "Death";
			sprite_index = Spr_Avatar_Death;
			CanMove = false;
		}
	}
}

showDialog = false;
RestartAfterDead = false;