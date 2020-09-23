if (!faded) {
	image_angle = (image_angle + 360 + 3) % 360;
	var scale = scale_anim.add_target(0.1);
	image_xscale = scale;
	image_yscale = scale;

	if (global.cam_focus == id) {
		var cam = cam_get_vars();
	
		if ((cam.cam_x >= target_x - 2 && cam.cam_x <= target_x + 2) && (cam.cam_y >= target_y - 2 && cam.cam_y <= target_y + 2)) {
			global.cam_focus = noone;
			camera_set_view_pos(cam.cam, target_x, target_y);
			exit;
		}
	
		camera_set_view_pos(cam.cam, lerp(cam.cam_x, target_x, 0.3), lerp(cam.cam_y, target_y, 0.3));
	}
}