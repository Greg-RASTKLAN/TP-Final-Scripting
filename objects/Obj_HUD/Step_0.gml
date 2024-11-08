/// @description Décrémentation des timer de cooldown
currentWeapon = Obj_Avatar.EquippedWeapon;

#region Skill 1
if (mouse_check_button_pressed(mb_left)) {
	countdown_active_s1 = true;
}

if (countdown_active_s1 && timer_s1 > 0) {
    timer_s1 -= 1;
} else if (timer_s1 <= 0) {
    timer_s1 = initial_time_s1;          
    countdown_active_s1 = false;    
}
#endregion

#region Skill 2
if (keyboard_check_pressed(ord("E"))) {
    countdown_active_s2 = true;
}

if (countdown_active_s2 && timer_s2 > 0) {
    timer_s2 -= 1;
} else if (timer_s2 <= 0) {
    timer_s2 = initial_time_s2;          
    countdown_active_s2 = false;    
}
#endregion

#region Skill 3
if (keyboard_check_pressed(ord("A"))) {
	countdown_active_s3 = true;
}

if (countdown_active_s3 && timer_s3 > 0) {
    timer_s3 -= 1;
} else if (timer_s3 <= 0) {
    timer_s3 = initial_time_s3;          
    countdown_active_s3 = false;    
}

#endregion




