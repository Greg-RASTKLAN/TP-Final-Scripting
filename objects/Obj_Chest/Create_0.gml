/// @description Simon Paradis

depth = -y; //Draw Order
opened = false;
image_speed = 0;
ShowInteract = false;

//FONCION appelée par l'Avatar.
//Ouvre le coffre 1 fois et anim, voir Event Anim End pour le Loot
function Fct_OpenChest(){
	opened = true;
	image_speed = 8;
}