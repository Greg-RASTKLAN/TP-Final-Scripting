/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_tab)) {
    show_inventory = !show_inventory;
}


var hovered_index = hovered_space();
var is_mouse_clicked = mouse_check_button_released(mb_left);

if(is_mouse_clicked && hovered_index != undefined)
{
	var item = items[hovered_index];
	if(item)
	{
		items[hovered_index] = undefined;
	}
}