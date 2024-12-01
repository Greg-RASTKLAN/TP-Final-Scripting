/// @description Système de Pause 
/* Explication 
   je me sers de Post draw car cet évènement vient juste avant que la surface de l'application
   elle même soit dessinée, avant même les évènements de GUI events
   On va capturer l'écran de notre jeu sur une surface, puis désactiver tous nos 
   autres objets du jeu pour dessiner la surface pendant l'écran de pause	*/
   
if (pause) {
    surface_set_target(application_surface);
    
    if (surface_exists(pauseSurf)) { draw_surface(pauseSurf, 0, 0);} // Cas conventionnel
	else { // Ce cas là intervient si on a perdu les données de la surface (exemple : plein ecran etc)
        pauseSurf = surface_create(resW, resH);
        buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
    }
    // Affichage ecran de pause
    draw_set_color(c_black);  
    draw_set_alpha(0.4);    
    draw_rectangle(0, 0, resW, resH, false);
    draw_set_color(c_white);
    draw_text(resW / 2, resH / 2, "Pause");
    surface_reset_target();
}
// Presser Echap pour faire pause
if (keyboard_check_pressed(vk_escape)) {
    if (!pause) {
        pause = true;
        // Désactive tout sauf cette instance (on veut aucun objet actif, le principe de mettre sur pause !!)
		instance_deactivate_all(true);
		
        // Création d'une surface qui correspond à la largeur et la hauteur de notre jeu
        pauseSurf = surface_create(resW, resH);
        surface_set_target(pauseSurf);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();
        // Ce buffer sert pour le cas ou on redimensionne le jeu (plein ecran) ou si le focus se perd
		// On stocke les valeurs RGBA de la surface dans le buffer
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
        pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
    } else { // Quand on réactive le jeu, on réactive toutes les instances du jeu qui reprend son cours
		pause = false;
        instance_activate_all();
		// Libérer la mémoire tampon
        if (surface_exists(pauseSurf)) surface_free(pauseSurf);
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
    }
}
draw_set_alpha(1);