#region Zooming View
if (global.cam_focus == noone) {
	if (mouse_wheel_down()) { //Zoom out
		zoom_camera(1);
	} else if (mouse_wheel_up()) { //Zoom in
		zoom_camera(-1);
	} else if (keyboard_check_pressed(ord("R"))) { //Zoom reset
		var cam = cam_get_vars();
		var center_x = cam.cam_x + cam.cam_w / 2;
		var center_y = cam.cam_y + cam.cam_h / 2;
		camera_set_view_size(cam.cam, view_wport[0], view_hport[0]);
		camera_set_view_pos(cam.cam, center_x - floor(view_wport[0] / 2), center_y - floor(view_hport[0] / 2));
	}
}
#endregion

#region Moving View
if (mouse_hold && (mouse_x != mouse_xprevious || mouse_y != mouse_yprevious)) {
	var dist = point_distance(mouse_x, mouse_y, mouse_xprevious, mouse_yprevious);
	var dir = point_direction(mouse_x, mouse_y, mouse_xprevious, mouse_yprevious);
	var cam = cam_get_vars();
	camera_set_view_pos(cam.cam, cam.cam_x + lengthdir_x(dist, dir), cam.cam_y + lengthdir_y(dist, dir));
}

mouse_hold = (global.cam_focus == noone && mouse_check_button(mb_middle));
mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;
#endregion

#region Misc. Inputs
//Search scene
if (global.cam_focus == noone) {
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("F"))) {
		var search = get_string("Type for the scene name you wanna search.", "");
		var scene = search_scene(search);
	
		if (scene == noone) {
			show_message("'" + search + "' was not found!");
			exit;
		}
	
		var cam = cam_get_vars();
		camera_set_view_pos(cam.cam, scene.x - cam.cam_w / 2, scene.y - cam.cam_h / 2);
	}
}

//Enabling pins
if (keyboard_check_pressed(vk_enter)) {
	place_pin = !place_pin;
}

//Restarting application
if (keyboard_check_pressed(vk_f5)) {
	global.last_cam = cam_get_vars();
	game_restart();
}

//Closing application
if (keyboard_check_pressed(vk_escape)) {
	game_end();
}
#endregion