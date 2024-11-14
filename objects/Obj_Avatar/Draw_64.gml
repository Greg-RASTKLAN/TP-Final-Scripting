/// @description Insert description here
// You can write your code in this editor

view_width = camera_get_view_width(0);
view_height = camera_get_view_height(0);


#region CoolDown Skill 1
var alarmNormalized = alarm_get(2);
if(alarm_get(2) < 0){
	alarmNormalized = 0;
}
var alarmNormalized = alarm_get(2);
var skill1_CDScale = (alarmNormalized/Skill_1_Cooldown);
//show_debug_message(string(skill1_CDScale));

if(!Skill_1_Ready){
	draw_sprite_ext(Spr_SkillBG, 0, view_width/2 - (view_width/3)/2 + 25, view_height-24,1,skill1_CDScale,0,c_white,0.7);
}
draw_sprite(Spr_Skill_Over,0,view_width/2 - (view_width/3)/2 + 25, view_height-120);
#endregion

#region CoolDown Skill 2
var alarmNormalized = alarm_get(3);
if(alarm_get(3) < 0){
	alarmNormalized = 0;
}
var alarmNormalized = alarm_get(3);
var skill2_CDScale = (alarmNormalized/Skill_2_Cooldown);
//show_debug_message(string(skill2_CDScale));

if(!Skill_2_Ready){
	draw_sprite_ext(Spr_SkillBG, 0, view_width/2 - (view_width/3)/2 + 125, view_height-24,1,skill2_CDScale,0,c_white,0.7);
}
draw_sprite(Spr_Skill_Over,0,view_width/2 - (view_width/3)/2 + 25, view_height-120);
#endregion

#region CoolDown Skill 3
var alarmNormalized = alarm_get(4);
if(alarm_get(4) < 0){
	alarmNormalized = 0;
}
var alarmNormalized = alarm_get(4);
var skill3_CDScale = (alarmNormalized/Skill_3_Cooldown);
//show_debug_message(string(skill3_CDScale));

if(!Skill_3_Ready) {
	draw_sprite_ext(Spr_SkillBG, 0, view_width/2 - (view_width/3)/2 + 225, view_height-24,1,skill3_CDScale,0,c_white,0.7);
}
draw_sprite(Spr_Skill_Over,0,view_width/2 - (view_width/3)/2 + 25, view_height-120);
#endregion


if(showDialog == true) {
	
	var screen_width = display_get_gui_width();
	var screen_height = display_get_gui_height();

	var rect_height = screen_height / 4;
	var rect_y = screen_height - rect_height;

	// Dessiner le rectangle en bas de l'écran
	draw_set_color(c_black);
	draw_set_alpha(0.9);
	draw_rectangle(0, rect_y, screen_width, screen_height, false);

	draw_set_alpha(1);
	draw_set_color(c_white);
	var text_x = screen_width / 2 - string_width(Obj_NPC.message) / 2;
	var text_y = rect_y + rect_height / 2 - string_height(Obj_NPC.message) / 2;

	draw_text(text_x, text_y, Obj_NPC.message);

}

draw_set_alpha(1);

