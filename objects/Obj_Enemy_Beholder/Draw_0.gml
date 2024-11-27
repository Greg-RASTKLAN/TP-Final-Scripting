/// @description Insert description here
// You can write your code in this editor
if(AvatarState != "Death" && AvatarState != "Hurt"){ //Already Drawn on Death and Hurt
	draw_sprite_ext(Spr_Shadow,0,x,y+48,2,1,0,c_white,1);
}
draw_self();

if(AvatarState != "Death"){
	draw_healthbar(x-16,y-sprite_height-16+128,x+16,y-sprite_height-10+128,(nbVies/nbViesMax)*100,c_gray,c_orange,c_red,0,true,true);
}
if(AvatarState == "Death"){
	view_width = camera_get_view_width(0);
	view_height = camera_get_view_height(0);
	draw_sprite(Spr_Victory, 0, view_width/2, view_height/2)
	audio_play_sound(snd_victory, 0, false);
	
	
	
}


//draw_text(x,y-64,string(_Xscale)+"   "+AvatarState);
//DEV Cercle d'Aggro
//draw_circle_color(x,y,AggroRange,c_red,c_red,true); 