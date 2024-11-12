/// @description Insert description here
// You can write your code in this editor
depth = -y; //Draw order

#region DIRECTION
direction = point_direction(x,y,Target_X,Target_Y);
image_angle = direction;
#endregion

#region MOUVEMENTS

_X = lengthdir_x(Vitesse, direction);
_Y = lengthdir_y(Vitesse, direction);

if(!place_meeting(x+_X,y+_Y,_Collisions) && distance_to_point(Target_X,Target_Y) > 10){
	x += _X;
	y += _Y;
} else{
	show_debug_message("asdda");
	instance_create_layer(x,y,"Instances",Obj_Enemy_AcidArea);
	instance_destroy();
}
#endregion