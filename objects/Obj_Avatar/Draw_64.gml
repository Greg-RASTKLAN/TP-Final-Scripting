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
show_debug_message(string(skill1_CDScale));

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
show_debug_message(string(skill2_CDScale));

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
show_debug_message(string(skill3_CDScale));

if(!Skill_3_Ready) {
	draw_sprite_ext(Spr_SkillBG, 0, view_width/2 - (view_width/3)/2 + 225, view_height-24,1,skill3_CDScale,0,c_white,0.7);
}
draw_sprite(Spr_Skill_Over,0,view_width/2 - (view_width/3)/2 + 25, view_height-120);
#endregion