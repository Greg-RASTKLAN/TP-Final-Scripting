/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = image_number-1;

//Spawn HP / MP Potions
instance_create_layer(x-16,y,"Instances",Obj_PotionHP);
instance_create_layer(x+16,y,"Instances",Obj_PotionMP);