/// @description Insert description here
// You can write your code in this editor
depth = -y;
/*if (Scr_SpriteAnimation()){
	instance_destroy();
}*/

Lifetime++;
direction++;
x = Obj_Avatar.x+lengthdir_x(30+Lifetime,direction);
y = Obj_Avatar.y-16+lengthdir_y(30+Lifetime,direction);
image_angle += RotationSpeed;
image_alpha -= 0.008;