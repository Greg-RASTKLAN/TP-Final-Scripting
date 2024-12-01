/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

_mouseposx = mouse_x;

VolumeValue = (_mouseposx-x-50);
VolumeValue = clamp(VolumeValue,0,135);

audio_master_gain(VolumeValue*0.01);

//if _mouseposx > x+50