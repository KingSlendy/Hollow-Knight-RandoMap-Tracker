draw_gui_button(floor(view_wport[0] / 2), 0, fa_center, fa_top, "Seed: " + string(global.seed), 10000, false);

if (draw_gui_button(0, 0, fa_left, fa_top, "Help", 10000, true)) {
	box_controls_anim.target = (box_controls_anim.target == 0) ? 1 : 0;
	place_pin = false;
}

var controls = "<MOUSE>\nHold Middle Click: Scroll screen\nWheel: Zoom in/out\nLeft Click: Entrance viewing/Pin placing\nHold Right Click: Move Scenes/Delete pins\n\n<KEYBOARD>\nF5: Update tracker log\nR: Reset zoom";
draw_gui_button(box_controls_anim.value, 32, fa_left, fa_top, controls, box_controls_size, false);

if (draw_gui_button(view_wport[0], 0, fa_right, fa_top, "Pins", 10000, true)) {
	box_pins_anim.target = (box_pins_anim.target == 0) ? 1 : 0;
	place_pin = false;
}

selected_pin = draw_gui_icons(view_wport[0] + box_pins_anim.value, view_hport[0] / 2, fa_right, fa_middle, icons_pin, 0, 3, true, selected_pin);