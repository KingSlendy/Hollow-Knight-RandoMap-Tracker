function mouse_hover(x1, y1, x2, y2) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	return point_in_rectangle(mx, my, x1, y1, x2, y2);
}

function draw_roundbox(x, y, text, hoverable) {
	draw_set_font(fntScenes);
	var width = string_width(text) * 1.05;
	var height = string_height(text) * 1.05;
	
	var x1 = x - width / 2;
	var y1 = y - height / 2;
	var x2 = x + width / 2;
	var y2 = y + height / 2;
	
	var hover = mouse_hover(x1, y1, x2, y2);
	var pressed = (hover && mouse_check_button_pressed(mb_left));
	var color = c_black;
	
	if (hoverable) {
		if (pressed) {
			color = c_ltgray;
		} else if (hover) {
			color = c_dkgray;
		}
	}
	
	draw_set_color(color);
	draw_roundrect(x1, y1, x2, y2, false);
	draw_set_color(c_white);
	draw_roundrect(x1, y1, x2, y2, true);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, text);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	return pressed;
}