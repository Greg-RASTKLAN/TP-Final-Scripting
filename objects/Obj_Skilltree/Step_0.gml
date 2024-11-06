/// @description Insert description here
// You can write your code in this editor
#region SKILLTREE AFFICHAGE
if (keyboard_check_pressed(ord("J"))) {
	show_debug_message("Transition vers la rmSkillTree")
	room_goto(rm_Skilltree);
}
if (keyboard_check_pressed(ord("K"))) {
	show_debug_message("Transition vers la rmSkillTree")
	room_goto(aRoom1);
}

#endregion
