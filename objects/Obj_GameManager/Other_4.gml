/// @description Setup Pathfinding and Music

//BG Music
audio_play_sound(snd_BackgroundWater, 0, true);

if(room == rm_Menui)	
	{audio_play_sound(snd_MainMenu, 0, false);}

//Hide collisions layer
layer_set_visible(layer_get_id("Ins_Collisions"), false);

//Nav Mesh for Pathfinding
var GridSize = 32;
grid = mp_grid_create(0, 0, room_width/GridSize, room_height/GridSize, GridSize, GridSize);


var lay_id = layer_get_id("whatever");
var map_id = layer_tilemap_get_id("FrontWalls_NoWater");

var cell_size = 32;
var w = room_width / GridSize;
var h = room_height / GridSize;

for (var i = 0; i < w; i++) {
for (var j = 0; j < h; j++) {
    if (tilemap_get_at_pixel(map_id, i * GridSize, j * GridSize) > 0)
    {
        mp_grid_add_cell(grid, i, j);
    }
}}

mp_grid_add_instances(grid, Obj_Collision, 0);