draw_self();

if (connected != noone && global.last == id) {
	draw_set_color($FF7AF0);
	draw_line_width(x, y, connected.x, connected.y, 5);
	draw_set_color(c_white);
}

if (scale_anim.target == 1) {
	draw_gui_button(x, floor(y - sprite_height / 2), fa_center, fa_bottom, entrance, 10000, false);
}