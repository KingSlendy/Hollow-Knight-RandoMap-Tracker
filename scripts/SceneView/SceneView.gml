global.cam_focus = noone;
global.last_cam = noone;

function cam_get_vars() {
	var camera = view_camera[0];
	
	return {
		cam: camera,
		cam_x: camera_get_view_x(camera),
		cam_y: camera_get_view_y(camera),
		cam_w: camera_get_view_width(camera),
		cam_h: camera_get_view_height(camera)
	};
}

function search_scene(search) {
	var scene = noone;

	with (objScene) {
		if (string_lower(name) == string_lower(search)) {
			scene = self;
		}
	}
	
	return scene;
}