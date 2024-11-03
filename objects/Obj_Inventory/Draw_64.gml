if (show_inventory) {
	var hovered_index = hovered_space();
	//show_debug_message(string(hovered_index))

	draw_set_alpha(0.5);
	draw_set_color(c_green);
	draw_rectangle(
		room_width - (padding * 2) - item_sprite_width, 0, 
		room_width, room_height, 
		false
	);



	// Dessine les cases d'inventaire
	for(var i = 0; i < capacity; i++)
	{
		draw_set_alpha(hovered_index == i ? 0.8 : 1.0);
		draw_sprite(
			Spr_InventoryMainBox, 0, 
			room_width - item_sprite_width - padding, 100 + (160 * i)
		);
	}
	
	
	// Dessine les items dans les cases d'inventaire
	for(var i = 0; i < array_length(items); i++)
	{
		if(items[i] == undefined) continue;
		draw_sprite(
			items[i].sprite_index, 
			0,
			room_width - item_sprite_width - padding, 100 + (160 * i)
		);
	}
}