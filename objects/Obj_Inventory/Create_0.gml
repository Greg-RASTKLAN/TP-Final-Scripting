/// @description 

capacity = 3
items = array_create(capacity, undefined);

item_sprite_width = sprite_get_width(Spr_InventoryMainBox);
item_sprite_height = sprite_get_height(Spr_InventoryMainBox);
padding = 64;

function pickup(sprite)
{
	if(not is_full())
	{
		for(var i = 0; i < capacity; i++)
		{
			if(items[i] == undefined) {
				items[i] = {sprite_index : sprite};
				return;
			}	
		}
	}	
}


/**
 * L'inventaire est plein si les items portés sont 
 * égaux a la capacité que l'on peut porter
 */
function is_full()
{
	for(var i = 0; i < capacity; i++)
	{
		if(items[i] == undefined) {
			return false;
		}
	}
	return true;
}

function hovered_space()
{
	//var mouse_x_in_room = mouse_x + camera_get_view_x(view_camera[0]);
	//var mouse_y_in_room = mouse_y + camera_get_view_y(view_camera[0]);
	var mouse_x_in_room = device_mouse_x_to_gui(0);
	var mouse_y_in_room = device_mouse_y_to_gui(0);
	
    for (var i = 0; i < capacity; i++)
    {
        var left = room_width - item_sprite_width - padding;
        var right = room_width - padding;
        var top = 100 + (160 * i);
        var bottom = top + item_sprite_height;

        // Log pour vérifier les positions du rectangle
        show_debug_message("Rectangle " + string(i) + ": (" + string(left) + ", " + string(top) + ", " + string(right) + ", " + string(bottom) + ")");
        show_debug_message("Mouse: (" + string(mouse_x_in_room) + ", " + string(mouse_y_in_room) + ")");
        
        if (point_in_rectangle(mouse_x_in_room, mouse_y_in_room, left, top, right, bottom))
        {
            show_debug_message("Mouse is over item " + string(i));
            return i;
        }
    }
    show_debug_message("Mouse is not over any item");
    return undefined;
}

