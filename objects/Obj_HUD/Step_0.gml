/// @description Insert description here
// You can write your code in this editor


// Gestion de l'appui sur la touche E
if (keyboard_check_pressed(ord("E") && !cooldown_active)) {
    // Démarrer le cooldown si ce n'est pas déjà actif
    cooldown_active = true;
    cooldown_timer = skill_2_Cooldown;  // Démarre le timer avec la durée du cooldown
}

// Réduire le cooldown si il est actif
if (cooldown_active) {
    cooldown_timer -= 1;
	show_debug_message(cooldown_timer)
    if (cooldown_timer <= 0) {
        cooldown_timer = 0;
        cooldown_active = false; // Arrêter le cooldown
		cooldown_timer = skill_2_Cooldown;
    }
}