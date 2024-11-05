/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur


// Récupérer les dimensions de la caméra
var cameraWidth = camera_get_view_width(view_camera[0]);
var cameraHeight = camera_get_view_height(view_camera[0]);

// Centre la caméra autour de l'avatar
if (instance_exists(Obj_Avatar)){
	x = Obj_Avatar.x - cameraWidth*0.5;
	y = Obj_Avatar.y - cameraHeight*0.5;
}

// Gère le cas de la fin de map pour pas finir la caméra dans un mur
x = clamp(x, 0, room_width -  cameraWidth);
y = clamp(y, 0, room_width -  cameraHeight);


// Règle la position de la caméra
camera_set_view_pos(view_camera[0], x, y);