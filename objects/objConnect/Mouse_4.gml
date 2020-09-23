if (!objController.place_pin && !faded && scene != noone) {
	global.cam_focus = id;
	global.last = id;
	var cam = cam_get_vars();
	target_x = scene.x - cam.cam_w / 2;
	target_y = scene.y - cam.cam_h / 2;
	
	with (objConnect) {
		if (!faded) {
			image_blend = c_white;
		}
	}
	
	image_blend = $FF7AF0;
	connected.image_blend = $FF7AF0;
}