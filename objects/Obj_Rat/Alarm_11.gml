/// @description Pathfinding
// You can write your code in this editor

path_delete(path);
path = path_add();

mp_grid_path(Obj_GameManager.grid, path, x, y, x+lengthdir_x(64,direction), y+lengthdir_y(64,direction), 1);
//mp_grid_path(Obj_GameManager.grid, path, x, y, mouse_x, mouse_y, 1);

path_start(path, Vitesse, path_action_stop, true);