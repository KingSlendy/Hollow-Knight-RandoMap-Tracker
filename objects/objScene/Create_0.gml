name = "N/A";
location = "N/A";
entrances = ds_list_create();
hover = false;
holding = false;
hold_x = 0;
hold_y = 0;
entrances_offsets = undefined;
//range = max(sprite_width / 2, sprite_height / 2) * 1.1;

function init(name) {
	self.name = name;
	
	if (!ds_map_exists(global.scene_infos, name)) {
		return;
	}
	
	var info = global.scene_infos[? name];
	sprite_index = asset_get_index("spr" + name);
	image_blend = info.blend;
	location = info.location;
	//range = max(sprite_width / 2, sprite_height / 2) * 1.1;
}