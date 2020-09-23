if (holding) {
	var xx = (mouse_x - hold_x) + sprite_xoffset;
	var yy = (mouse_y - hold_y) + sprite_yoffset;
	//collision_circle(xx, yy, range, objScene, false, true) == noone
	if (collision_rectangle(xx - sprite_width / 2, yy - sprite_height / 2, xx + sprite_width / 2, yy + sprite_height / 2, objScene, false, true) == noone) {
		x = xx;
		y = yy;
		var size = ds_list_size(entrances);

		for (var i = 0; i < size; i++) {
			var entrance = entrances[| i];
			var offset = entrances_offsets[i];
			entrance.x = x + offset.ex;
			entrance.y = y + offset.ey;
		}
	}
}