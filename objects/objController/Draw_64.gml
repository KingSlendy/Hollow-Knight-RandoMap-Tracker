draw_roundbox(room_width / 2, 40, "Seed: " + string(global.seed), false);

if (draw_roundbox(60, 40, "Controls", true)) {
	box_controls_anim.target = (box_controls_anim.target == 0) ? 1 : 0;
}

var controls = "MOUSE\nHold Middle Click: Scroll screen\nLeft Click: Entrance scroll\nHold Right Click: Move Scenes\n\nKEYBOARD\nCtrl + F: Search Scene by name\nF2: Update tracker log\nEsc: Exit application";
draw_roundbox(box_controls_anim.value, 160, controls, false);