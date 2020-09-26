#region Initialization
depth = -1;
x = view_wport[0] / 2;
y = view_hport[0] / 2;

//Adjusts the background scale to fit on the window perfectly
var cam = cam_get_vars();
layer_bkg = layer_background_get_id("Background");
layer_background_xscale(layer_bkg, cam.cam_w / sprite_get_width(sprBkgMain));
layer_background_yscale(layer_bkg, cam.cam_h / sprite_get_height(sprBkgMain));
bkg_xscale = layer_background_get_xscale(layer_bkg);
bkg_yscale = layer_background_get_yscale(layer_bkg);

zoom_level = 45;
mouse_hold = false;
mouse_xprevious = 0;
mouse_yprevious = 0;
box_controls_size = 300;
box_controls_anim = new TargetAnim(-(box_controls_size + 30), box_controls_size + 30, 0);
box_pins_anim = new TargetAnim(0, 400, 1);
icons_pin = [
	sprPinBlue,
	sprPinRed,
	sprPinSilver,
	sprPinGold,
	sprPinTree,
	sprPinBenchGray,
	sprPinBench,
	sprPinIsma,
	sprPinCrystal,
	sprPinWings,
	sprPinClaws
];

selected_pin = 0;
place_pin = false;

//Starts the camera in the last position it was before reloading
if (global.last_cam != noone) {
	camera_set_view_pos(cam.cam, global.last_cam.cam_x, global.last_cam.cam_y);
	camera_set_view_size(cam.cam, global.last_cam.cam_w, global.last_cam.cam_h);
	global.last_cam = noone;
}

function static_background() {
	var cam = cam_get_vars();
	layer_x("Background", cam.cam_x);
	layer_y("Background", cam.cam_y);
	layer_background_xscale(layer_bkg, bkg_xscale * cam.cam_w / view_wport[0]);
	layer_background_yscale(layer_bkg, bkg_yscale * cam.cam_h / view_hport[0]);
}

function zoom_camera(zoom) {
	var cam = cam_get_vars();
	
	if ((zoom == -1 && cam.cam_w <= view_wport[0]) || (zoom == 1 && cam.cam_w >= view_wport[0] * 5)) {
		return;
	}
	
	var level = zoom_level * zoom;
	camera_set_view_size(cam.cam, cam.cam_w + level, cam.cam_h + level);
	camera_set_view_pos(cam.cam, cam.cam_x - (level / 2), cam.cam_y - (level / 2));
}
#endregion

#region Parse Randomizer Tracker Log
var log_path = environment_get_variable("APPDATA");
log_path = string_replace(log_path, "\\Roaming", "");
log_path += "\\LocalLow\\Team Cherry\\Hollow Knight\\RandomizerTrackerLog.txt";
show_debug_message(log_path);
var transitions = parse_tracker(log_path);
#endregion

#region Create Scenes
ini_open(string(global.seed) + ".ini");
var size = ds_list_size(transitions);

for (var i = 0; i < size; i += 2) {
	var transition1 = transitions[| i];
	var scene1 = search_scene(transition1.name);
	
	if (scene1 == noone) {
		var read = ini_read_string("Scenes", transition1.name, noone);
		var xx = x;
		var yy = y;
		
		if (read != noone) {
			var info = ds_map_create();
			ds_map_read(info, read);
			xx = info[? "x"];
			yy = info[? "y"];
			ds_map_destroy(info);
		}
		
		scene1 = instance_create_layer(xx, yy, "Instances", objScene);
		
		with (scene1) {
			while (place_meeting(x, y, objScene)) {
				x += global.scene_sep;
			}
		}
		
		scene1.init(transition1.name);
	}
	
	var transition2 = transitions[| (i + 1)];
	var scene2 = search_scene(transition2.name);
	
	if (scene2 == noone) {
		var read = ini_read_string("Scenes", transition2.name, noone);
		var xx = x;
		var yy = y;
		
		if (read != noone) {
			var info = ds_map_create();
			ds_map_read(info, read);
			xx = info[? "x"];
			yy = info[? "y"];
			ds_map_destroy(info);
		}
		
		scene2 = instance_create_layer(xx, yy, "Instances", objScene);
		
		with (scene2) {
			while (place_meeting(x, y, objScene)) {
				x += global.scene_sep;
			}
		}
		
		scene2.init(transition2.name);
	}
	
	var connect1 = noone;
	var connect2 = noone;
	
	if (instance_exists(objConnect)) {
		with (objConnect) {
			if (name == transition1.name && entrance == transition1.entrance) {
				connect1 = self;
			}
		}
	
		with (objConnect) {
			if (name == transition2.name && entrance == transition2.entrance) {
				connect2 = self;
			}
		}
	}
	
	if (connect1 == noone) {
		with (scene1) {
			var entrances = global.default_entrances[? transition1.entrance];
			
			if (ds_map_exists(global.scene_infos, transition1.name)) {
				entrances = global.scene_infos[? transition1.name].entrances[? transition1.entrance];
			}
			
			connect1 = instance_create_layer(x + entrances.ex, y + entrances.ey, "Instances", objConnect);
			connect1.name = transition1.name;
			connect1.entrance = transition1.entrance;
			connect1.scene = scene2;
		}
	}
	
	if (connect2 == noone) {
		with (scene2) {
			var entrances = global.default_entrances[? transition2.entrance];
			
			if (ds_map_exists(global.scene_infos, transition2.name)) {
				entrances = global.scene_infos[? transition2.name].entrances[? transition2.entrance];
			}
			
			connect2 = instance_create_layer(x + entrances.ex, y + entrances.ey, "Instances", objConnect);
			connect2.name = transition2.name;
			connect2.entrance = transition2.entrance;
			connect2.scene = scene1;
		}
	}
	
	connect1.connected = connect2;
	connect2.connected = connect1;
	ds_list_add(scene1.entrances, connect1);
	ds_list_add(scene2.entrances, connect2);
}

//Create all connections which haven't been discovered
/*var all_scenes = [];
ds_map_keys_to_array(global.scene_infos, all_scenes);
var length1 = array_length(all_scenes);

for (var i = 0; i < length1; i++) {
	var get_scene = noone;
	
	with (objScene) {
		if (name == all_scenes[i]) {
			get_scene = self;
			break;
		}
	}
	
	if (get_scene == noone) {
		continue;
	}
	
	var get_entrances = global.scene_infos[? all_scenes[i]].entrances;
	var all_entrances = [];
	ds_map_keys_to_array(get_entrances, all_entrances);
	var length2 = array_length(all_entrances);
	
	for (var j = 0; j < length2; j++) {
		var scene_entrances = get_scene.entrances;
		var size = ds_list_size(scene_entrances);
		var contained = false;
		
		for (var k = 0; k < size; k++) {
			if (all_entrances[j] == scene_entrances[| k].entrance) {
				contained = true;
				break;
			}
		}
		
		if (contained) {
			continue;
		}
		
		var entrance_object = get_entrances[? all_entrances[j]];
		var connect = instance_create_layer(get_scene.x + entrance_object.ex, get_scene.y + entrance_object.ey, "Instances", objConnect);
		connect.image_blend = c_red;
		connect.faded = true;
		connect.name = all_scenes[i];
		connect.entrance = all_entrances[j];
		ds_list_add(scene_entrances, connect);
	}
}*/

var pins = ds_map_create();
var info = ini_read_string("Pins", "Info", undefined);

if (!is_undefined(info)) {
	ds_map_read(pins, info);
	var keys = [];
	ds_map_keys_to_array(pins, keys);
	var length = array_length(keys);
	
	for (var i = 0; i < length; i++) {
		var pin = pins[? keys[i]];
		
		with (instance_create_layer(pin[0], pin[1], "Instances", objPin)) {
			sprite_index = pin[2];
		}
	}
}

ds_map_destroy(pins);
ini_close();
#endregion