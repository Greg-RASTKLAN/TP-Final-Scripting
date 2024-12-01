/// @description Insert description here
// You can write your code in this editor

_Collisions = layer_tilemap_get_id("FrontWalls_NoWater");

audio_play_sound(snd_BackgroundWater, 0, true);

if(room == rm_Menui)	
	{audio_play_sound(snd_MainMenu, 0, false);}

//Hide collisions layer
layer_set_visible(layer_get_id("Ins_Collisions"), false);

//Nav Mesh for Pathfinding
var GridSize = 32;
grid = mp_grid_create(0, 0, room_width/GridSize, room_height/GridSize, GridSize, GridSize);
mp_grid_add_instances(grid, Obj_Collision, 0);
mp_grid_add_instances(grid, _Collisions, 1);