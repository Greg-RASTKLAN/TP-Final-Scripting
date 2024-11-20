/// @description Insert description here
// You can write your code in this editor
pauseSurf = surface_create(resW, resH);
        surface_set_target(pauseSurf);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();
		
        pause = true;