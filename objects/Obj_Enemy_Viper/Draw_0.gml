/// @description Insert description here
// You can write your code in this editor
draw_sprite(Spr_Shadow,0,x,y+4);
draw_self();

if(AvatarState != "Death"){
	draw_healthbar(x-16,y-sprite_height-16,x+16,y-sprite_height-10,(nbVies/nbViesMax)*100,c_gray,c_orange,c_red,0,true,true);
}

//draw_text(x,y-64,string(_Xscale)+"   "+AvatarState);
//DEV Cercle d'Aggro
//draw_circle_color(x,y,AggroRange,c_red,c_red,true); 