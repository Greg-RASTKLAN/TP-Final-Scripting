/// @description Insert description here
// You can write your code in this editor
depth = -y; //Draw order

#region ATTACK
if(AvatarState != "Hurt" && AvatarState != "Death"){
	if(AvatarState == "BulletHell"){ //Atk 3 BulletHell in action
		if(BulletHellStep < BulletHellDuration){
			BulletHellStep++;
			if(BulletHellStep %20 == 0){
				for(i=0;i<=nbBullets;i++){
					var _Bullet = instance_create_layer(x,y,"Instances",Obj_Bullet);
					_Bullet.direction = irandom_range(0,359);
					 audio_play_sound(snd_skillBeholder, 1, false);
				}
			}
		} else{
			AvatarState = "Idle";
			BulletHellStep = 0;
		}
	} else if (Attack1_Ready && distance_to_object(Obj_Avatar) <= Attack1_Range 
	&& distance_to_object(Obj_Avatar) > Attack2_Range){ //Atk 3 BulletHell Activate
		AvatarState = "BulletHell";
		sprite_index = Spr_Beholder_Spin;
		Attack1_Ready = false;
		alarm_set(2,Attack1_Cooldown);
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		/*_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;*/
	} else if (distance_to_object(Obj_Avatar) <= Attack2_Range){ //Atk3 Spin
		AvatarState = "Attack";
		sprite_index = Spr_Beholder_Spin;
		Attack2_Ready = false;
		alarm_set(3,Attack2_Cooldown);
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		/*_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;*/
		Obj_Avatar.fct_Dommages(DommagesSpin);
	} else if (distance_to_object(Obj_Avatar) <= AggroRange){ //Move to Avatar
		AvatarState = "Walk"
		sprite_index = Spr_Beholder_Idle;
		EnemyTarget = Obj_Avatar;
		_Dir = point_direction(x,y,EnemyTarget.x,EnemyTarget.y);
		direction = _Dir;
		//Movements And Collisions
		_X = lengthdir_x(Vitesse,direction);
		if(!place_meeting(x+_X, y,_Collisions)){
			x += _X;
		}
		_Y = lengthdir_y(Vitesse,direction);
		if(!place_meeting(x, y+_Y,_Collisions)){
			y += _Y;
		}
		Scr_SpriteAnimation();
		/*_Xscale = sign(round(x-xprevious));
		if(_Xscale == 0){_Xscale = -1;}
		image_xscale = _Xscale;*/
	} else{ //Idle
		AvatarState = "Idle";
		sprite_index = Spr_Beholder_Idle;
		EnemyTarget = 0;
		Scr_SpriteAnimation();
	}
}
#endregion


#region Beholder sounds
if(AvatarState == "Death") {
	audio_stop_sound(snd_epicMusic_Beholder);
	audio_stop_sound(snd_souris) 

}



// Obtenez les dimensions de la caméra actuelle
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);

// Vérifiez si l'ennemi est dans les limites de la caméra
if (x > cam_x && x < cam_x + cam_width && y > cam_y && y < cam_y + cam_height && AvatarState != "Death") {
    // L'ennemi est visible, lancer la musique
    if (!audio_is_playing(snd_epicMusic_Beholder)) {
        audio_play_sound(snd_epicMusic_Beholder, 1, true);
	
    }
}


#endregion
