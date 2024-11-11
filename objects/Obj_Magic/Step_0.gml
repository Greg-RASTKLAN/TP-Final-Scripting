/// @description Insert description here
// You can write your code in this editor
depth = -y; //Draw order

#region DIRECTION
image_angle = direction;
#endregion

#region MOUVEMENTS

_X = lengthdir_x(Vitesse, direction);
_Y = lengthdir_y(Vitesse, direction);

if(!place_meeting(x+_X,y+_Y,_Collisions)){
	x += _X;
	y += _Y;
} else{
	instance_destroy();
}
#endregion