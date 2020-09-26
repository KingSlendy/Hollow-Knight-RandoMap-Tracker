function gui_mouse_hover(x1, y1, x2, y2) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	return point_in_rectangle(mx, my, x1, y1, x2, y2);
}

function gui_align(x, y, w, h, ha, va) {
	var x1, y1, x2, y2;
	
	switch (ha) {
		case fa_left:
			x1 = x;
			x2 = x + w;
			break;
			
		case fa_center:
			x1 = floor(x - w / 2);
			x2 = floor(x + w / 2);
			break;
			
		case fa_right:
			x1 = x - w;
			x2 = x;
			break;
	}
	
	switch (va) {
		case fa_top:
			y1 = y;
			y2 = y + h;
			break;
			
		case fa_middle:
			y1 = floor(y - h / 2);
			y2 = floor(y + h / 2);
			break;
			
		case fa_bottom:
			y1 = y - h;
			y2 = y ;
			break;
	}
	
	return {
		x1: x1,
		y1: y1,
		x2: x2,
		y2: y2
	}
}

function draw_gui_button(x, y, ha, va, text, sw, selectable) {
	draw_set_font(fntScenes);
	var w = floor(string_width_ext(text, -1, sw) * 1.06) - 1;
	var h = floor(string_height_ext(text, -1, sw) * 1.06) - 1;
	var align = gui_align(x, y, w, h, ha, va);
	var cx = floor(align.x1 + w / 2);
	var cy = floor(align.y1 + h / 2);
	
	var hover = gui_mouse_hover(align.x1, align.y1, align.x2, align.y2);
	var pressed = (hover && mouse_check_button_pressed(mb_left));
	var color = c_black;
	
	if (selectable) {
		if (pressed) {
			color = c_ltgray;
		} else if (hover) {
			color = c_dkgray;
		}
	}
	
	draw_set_color(color);
	draw_roundrect(align.x1, align.y1, align.x2, align.y2, false);
	draw_set_color(c_white);
	draw_roundrect(align.x1, align.y1, align.x2, align.y2, true);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext(cx, cy, text, -1, sw);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	return pressed;
}

function draw_gui_icons(x, y, ha, va, icons, sep, cols, selectable, selected) {
	var length = array_length(icons);
	var w = 0;
	var h = 0;
	
	for (var i = 0; i < length; i++) {
		var icon = icons[i];
		w = max(w, sprite_get_width(icon));
		h = max(h, sprite_get_height(icon));
	}
	
	var align = gui_align(x, y, w * cols + sep * (cols - 1), ceil(length / cols) * h + sep * (ceil(length / cols) - 1), ha, va);
	
	draw_set_color(c_black);
	draw_roundrect(align.x1, align.y1, align.x2, align.y2, false);
	draw_set_color(c_white);
	draw_roundrect(align.x1, align.y1, align.x2, align.y2, true);
	var select = -1;
	
	for (var i = 0; i < length; i++) {
		var icon = icons[i];
		var xx = align.x1 + w * (i % cols) + sep * (i % cols);
		var yy = align.y1 + h * (i div cols) + sep * (i div cols);
		var hover = gui_mouse_hover(xx, yy, xx + w, yy + h);
		var pressed = (hover && mouse_check_button_pressed(mb_left));
		
		if (selectable && pressed) {
			draw_set_color(c_ltgray);
			draw_roundrect(xx, yy, xx + w, yy + h, false);
			select = i;
		}
		
		draw_sprite(icon, 0, xx + w / 2, yy + h / 2);
		
		if (selectable && hover || i == selected) {
			draw_set_color((i == selected) ? c_lime : c_yellow);
			draw_roundrect(xx, yy, xx + w, yy + h, true);
		}
	}
	
	return (select != -1) ? select : selected;
}