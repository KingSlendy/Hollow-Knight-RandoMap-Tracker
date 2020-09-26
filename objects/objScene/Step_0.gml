if (holding) {
	var prev_x = x;
	var prev_y = y;
	var xx = (mouse_x - hold_x) + sprite_xoffset;
	var yy = (mouse_y - hold_y) + sprite_yoffset;
	instance_deactivate_object(self);
	
	if (!place_meeting(xx, y, objScene)) {
		x = xx;
	}
	
	if (!place_meeting(x, yy, objScene)) {
		y = yy;
	}
	
	instance_activate_object(self);
	
	if (x != prev_x || y != prev_y) {
		var size = ds_list_size(entrances);

		for (var i = 0; i < size; i++) {
			var entrance = entrances[| i];
			var offset = entrances_offsets[i];
			entrance.x = x + offset.ex;
			entrance.y = y + offset.ey;
		}
	}
}