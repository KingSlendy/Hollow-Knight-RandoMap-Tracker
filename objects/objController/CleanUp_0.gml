/*var scenes = [];
ds_map_keys_to_array(global.scene_infos, scenes);
var length = array_length(scenes);

for (var i = 0; i < length; i++) {
	if (scenes[i].entrances != global.default_entrances) {
		ds_map_destroy(scenes[i].entrances);
	}
}*/

with (objScene) {
	ds_list_destroy(entrances);
}

ini_open(string(global.seed) + ".ini");

with (objScene) {
	var info = ds_map_create();
	info[? "x"] = floor(x);
	info[? "y"] = floor(y);
	ini_write_string("Scenes", name, ds_map_write(info));
	ds_map_destroy(info);
}

var pins = ds_map_create();

with (objPin) {
	pins[? id] = [floor(x), floor(y), sprite_index];
}

ini_write_string("Pins", "Info", ds_map_write(pins));
ds_map_destroy(pins);
ini_close();