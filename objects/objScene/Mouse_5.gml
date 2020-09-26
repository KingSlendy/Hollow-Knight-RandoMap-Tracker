if (objController.place_pin) {
	exit;
}

holding = true;
hold_x = abs(mouse_x - (x - sprite_xoffset));
hold_y = abs(mouse_y - (y - sprite_yoffset));
var size = ds_list_size(entrances);

for (var i = 0; i < size; i++) {
	entrances_offsets[i] = {
		ex: entrances[| i].x - x,
		ey: entrances[| i].y - y
	}
}