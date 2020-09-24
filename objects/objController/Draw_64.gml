draw_gui_button(floor(view_wport[0] / 2), 0, fa_center, fa_top, "Seed: " + string(global.seed), 10000, false);

if (draw_gui_button(0, 0, fa_left, fa_top, "Controls", 10000, true)) {
	box_controls_anim.target = (box_controls_anim.target == 0) ? 1 : 0;
}

var controls = "<MOUSE>\nHold Middle Click: Scroll screen\nLeft Click: Entrance scroll\nHold Right Click: Move Scenes\n\n<KEYBOARD>\nCtrl + F: Search Scene by name\nF2: Update tracker log\nEsc: Exit application";
draw_gui_button(box_controls_anim.value, 32, fa_left, fa_top, controls, box_controls_size, false);