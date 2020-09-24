global.scene_sep = 500;
global.scene_infos = ds_map_create();

var Scene = function(name, location, blend, entrances) constructor {
	global.scene_infos[? name] = self;
	self.name = name;
	self.location = location;
	self.blend = blend;
	self.entrances = entrances;
	
	add_entrance = function(entrance, x, y) {
		var sprite = asset_get_index("spr" + name);
		
		entrances[? entrance] = {
			ex: -sprite_get_xoffset(sprite) + x,
			ey: -sprite_get_yoffset(sprite) + y
		};
	}
}

#region Location Names
var basin = "Ancient Basin";
var city = "City of Tears";
var peak = "Crystal Peak";
var nest = "Deepnest";
var town = "Dirthmouth";
var fog = "Fog Canyon";
var roads = "Forgotten Crossroads";
var wastes = "Fungal Wastes";
var path = "Greenpath";
var cliffs = "Howling Cliffs";
var edge = "Kingdom's Edge";
var queens = "Queen's Gardens";
var rest = "Resting Grounds";
var water = "Royal Waterways";
var abyss = "The Abyss";
var hive = "The Hive";
var palace = "White Palace";
#endregion

#region Location Colors
var c_basin = $FFFFFF;
var c_city = $A66747;
var c_peak = c_white;
var c_nest = c_white;
var c_town = c_white;
var c_fog = c_white;
var c_roads = $CCAB64;
var c_wastes = c_white;
var c_path = c_white;
var c_cliffs = c_ltgray;
var c_edge = c_white;
var c_queens = c_white;
var c_rest = c_white;
var c_water = c_white;
var c_abyss = $FFFFFF;
var c_hive = c_white;
var c_palace = c_white;
#endregion

#region Set Default Entrances
var sep = 225;
var part_w = sep / 5;
var part_h = sep / 5;
global.default_entrances = ds_map_create();
	
for (var i = 0; i < 5; i++) {
	global.default_entrances[? ("right" + string(i))] = {
		ex: sep / 2,
		ey: -(sep / 2 + part_h * i)
	};
	
	global.default_entrances[? ("top" + string(i))] = {
		ex: -(sep / 2 + part_w * i),
		ey: -(sep / 2)
	};
	
	global.default_entrances[? ("left" + string(i))] = {
		ex: -(sep / 2),
		ey: -(sep / 2 + part_h * i)
	};
	
	global.default_entrances[? ("bot" + string(i))] = {
		ex: -(sep / 2 + part_w * i),
		ey: sep / 2
	};
	
	global.default_entrances[? ("door" + string(i))] = {
		ex: -(sep / 2 + part_w * i),
		ey: sep / 2 + 50
	};
}

var special_doors = [
	"door_jiji",
	"door_mapper",
	"door_bretta",
	"door_sly",
	"door_station",
	"door_Ruin_House_01",
	"door_charmshop",
	"door_Mender_House",
	"door_Mansion",
	"door_SlugShrine",
	"door_Ruin_House_02",
	"door_Ruin_Elevator",
	"door_Ruin_House_03"
];

var length = array_length(special_doors);

for (var i = 0; i < length; i++) {
	global.default_entrances[? special_doors[i]] = {
		ex: -(sep / 2 + part_w * i),
		ey: sep / 2 + 100
	};
}
#endregion

var a = undefined;
a = new Scene("Abyss_01", city, c_city, global.default_entrances);
a = new Scene("Abyss_02", basin, c_basin, global.default_entrances);
a = new Scene("Abyss_03", basin, c_basin, global.default_entrances);
a = new Scene("Abyss_03b", nest, c_nest, global.default_entrances);
a = new Scene("Abyss_03c", edge, c_edge, global.default_entrances);
a = new Scene("Abyss_04", basin, c_basin, global.default_entrances);
a = new Scene("Abyss_05", basin, c_basin, global.default_entrances);

a = new Scene("Abyss_06_Core", abyss, c_abyss, ds_map_create());
a.add_entrance("left1", 8, 190);
a.add_entrance("left3", 5, 438);
a.add_entrance("top1", 152, 7);
a.add_entrance("right2", 171, 438);
a.add_entrance("bot1", 82, 449);

a = new Scene("Abyss_08", abyss, c_abyss, global.default_entrances);
a = new Scene("Abyss_09", abyss, c_abyss, global.default_entrances);
a = new Scene("Abyss_10", abyss, c_abyss, global.default_entrances);
a = new Scene("Abyss_12", abyss, c_abyss, global.default_entrances);
a = new Scene("Abyss_16", abyss, c_abyss, global.default_entrances);
a = new Scene("Abyss_17", abyss, c_abyss, global.default_entrances);
a = new Scene("Abyss_18", basin, c_basin, global.default_entrances);
a = new Scene("Abyss_19", basin, c_basin, global.default_entrances);
a = new Scene("Abyss_20", basin, c_basin, global.default_entrances);
a = new Scene("Abyss_21", basin, c_basin, global.default_entrances);
a = new Scene("Abyss_22", basin, c_basin, global.default_entrances);
a = new Scene("Cliffs_01", cliffs, c_cliffs, global.default_entrances);
a = new Scene("Cliffs_02", cliffs, c_cliffs, global.default_entrances);
a = new Scene("Cliffs_03", cliffs, c_cliffs, global.default_entrances);
a = new Scene("Cliffs_04", cliffs, c_cliffs, global.default_entrances);
a = new Scene("Cliffs_05", cliffs, c_cliffs, global.default_entrances);
a = new Scene("Cliffs_06", cliffs, c_cliffs, global.default_entrances);

a = new Scene("Crossroads_01", roads, c_roads, ds_map_create());
a.add_entrance("top1", 83, 2);
a.add_entrance("right1", 154, 51);
a.add_entrance("left1", 2, 64);

a = new Scene("Crossroads_02", roads, c_roads, ds_map_create());
a.add_entrance("left1", 0, 38);
a.add_entrance("door1", 69, 38);
a.add_entrance("right1", 136, 38);

a = new Scene("Crossroads_03", roads, c_roads, ds_map_create());
a.add_entrance("right1", 47, 35);
a.add_entrance("left2", 0, 122);
a.add_entrance("right2", 47, 81);
a.add_entrance("left1", 0, 85);
a.add_entrance("bot1", 0, 85);
a.add_entrance("top1", 22, 0);

a = new Scene("Crossroads_04", roads, c_roads, ds_map_create());
a.add_entrance("right1", 241, 11);
a.add_entrance("left1", 0, 15);
a.add_entrance("door_Mender_House", 81, 57);
a.add_entrance("door1", 133, 57);
a.add_entrance("door_charmshop", 218, 44);
a.add_entrance("top1", 99, 0);

a = new Scene("Crossroads_05", roads, c_roads, ds_map_create());
a.add_entrance("left1", 0, 31);
a.add_entrance("right1", 125, 31);

a = new Scene("Crossroads_06", roads, c_roads, ds_map_create());
a.add_entrance("left1", 0, 79);
a.add_entrance("door1", 42, 44);
a.add_entrance("right1", 85, 79);

a = new Scene("Crossroads_07", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_08", roads, c_roads, global.default_entrances);

a = new Scene("Crossroads_09", roads, c_roads, ds_map_create());
a.add_entrance("left1", 4, 21);
a.add_entrance("right1", 120, 21);

a = new Scene("Crossroads_10", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_11", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_12", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_13", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_14", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_15", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_16", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_18", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_19", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_21", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_22", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_25", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_27", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_30", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_31", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_33", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_35", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_36", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_37", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_38", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_39", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_40", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_42", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_43", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_45", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_46", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_46b", rest, c_rest, global.default_entrances);
a = new Scene("Crossroads_47", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_48", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_49", roads, c_roads, global.default_entrances);
a = new Scene("Crossroads_49b", city, c_city, global.default_entrances);
a = new Scene("Crossroads_50", rest, c_rest, global.default_entrances);
a = new Scene("Crossroads_52", roads, c_roads, global.default_entrances);
a = new Scene("Deepnest_01", wastes, c_wastes, global.default_entrances);
a = new Scene("Deepnest_01b", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_02", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_03", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_09", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_10", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_14", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_16", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_17", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_26", nest, c_nest, global.default_entrances);

a = new Scene("Deepnest_26b", nest, c_nest, ds_map_create());
a.add_entrance("right1", 201, 57);
a.add_entrance("right2", 201, 31); 

a = new Scene("Deepnest_30", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_31", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_32", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_33", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_34", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_35", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_36", nest, c_nest, global.default_entrances);

a = new Scene("Deepnest_37", nest, c_nest, ds_map_create());
a.add_entrance("right1", 143, 45);
a.add_entrance("top1", 37, 3);
a.add_entrance("left1", 4, 45);
a.add_entrance("bot1", 75, 52);

a = new Scene("Deepnest_38", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_39", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_40", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_41", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_42", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_43", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_44", nest, c_nest, global.default_entrances);
a = new Scene("Deepnest_East_01", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_02", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_03", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_04", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_06", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_07", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_08", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_09", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_10", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_11", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_12", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_13", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_14", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_14b", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_15", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_16", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_18", edge, c_edge, global.default_entrances);
a = new Scene("Deepnest_East_Hornet", edge, c_edge, global.default_entrances);
a = new Scene("Fungus1_01", path, c_path, global.default_entrances);
a = new Scene("Fungus1_01b", path, c_path, global.default_entrances);
a = new Scene("Fungus1_02", path, c_path, global.default_entrances);
a = new Scene("Fungus1_03", path, c_path, global.default_entrances);
a = new Scene("Fungus1_04", path, c_path, global.default_entrances);

a = new Scene("Fungus1_05", path, c_path, ds_map_create());
a.add_entrance("right1", 48, 132);
a.add_entrance("top1", 32, 4);
a.add_entrance("bot1", 20, 140);

a = new Scene("Fungus1_06", path, c_path, global.default_entrances);
a = new Scene("Fungus1_07", path, c_path, global.default_entrances);
a = new Scene("Fungus1_08", path, c_path, global.default_entrances);
a = new Scene("Fungus1_09", path, c_path, global.default_entrances);
a = new Scene("Fungus1_10", path, c_path, global.default_entrances);
a = new Scene("Fungus1_11", path, c_path, global.default_entrances);
a = new Scene("Fungus1_12", path, c_path, global.default_entrances);
a = new Scene("Fungus1_13", path, c_path, global.default_entrances);
a = new Scene("Fungus1_14", path, c_path, global.default_entrances);
a = new Scene("Fungus1_15", path, c_path, global.default_entrances);
a = new Scene("Fungus1_16_alt", path, c_path, global.default_entrances);
a = new Scene("Fungus1_17", path, c_path, global.default_entrances);
a = new Scene("Fungus1_19", path, c_path, global.default_entrances);
a = new Scene("Fungus1_20_v02", path, c_path, global.default_entrances);
a = new Scene("Fungus1_21", path, c_path, global.default_entrances);
a = new Scene("Fungus1_22", path, c_path, global.default_entrances);
a = new Scene("Fungus1_23", queens, c_queens, global.default_entrances);
a = new Scene("Fungus1_24", queens, c_queens, global.default_entrances);
a = new Scene("Fungus1_25", path, c_path, global.default_entrances);
a = new Scene("Fungus1_26", path, c_path, global.default_entrances);
a = new Scene("Fungus1_28", cliffs, c_cliffs, global.default_entrances);
a = new Scene("Fungus1_29", path, c_path, global.default_entrances);
a = new Scene("Fungus1_30", path, c_path, global.default_entrances);
a = new Scene("Fungus1_31", path, c_path, global.default_entrances);
a = new Scene("Fungus1_32", path, c_path, global.default_entrances);
a = new Scene("Fungus1_34", path, c_path, global.default_entrances);
a = new Scene("Fungus1_37", path, c_path, global.default_entrances);
a = new Scene("Fungus1_Slug", path, c_path, global.default_entrances);
a = new Scene("Fungus2_01", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_02", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_03", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_04", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_05", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_06", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_07", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_08", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_09", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_10", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_11", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_12", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_13", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_14", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_15", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_17", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_18", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_19", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_20", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_21", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_23", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_23", nest, c_nest, global.default_entrances);
a = new Scene("Fungus2_26", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_28", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_29", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_30", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_31", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_32", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_33", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus2_34", wastes, c_wastes, global.default_entrances);
a = new Scene("Fungus3_01", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_02", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_03", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_04", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_05", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_08", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_10", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_11", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_13", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_21", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_22", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_23", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_24", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_25", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_25b", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_26", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_27", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_28", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_30", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_34", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_35", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_39", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_40", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_44", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_47", fog, c_fog, global.default_entrances);
a = new Scene("Fungus3_48", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_49", queens, c_queens, global.default_entrances);
a = new Scene("Fungus3_50", queens, c_queens, global.default_entrances);
a = new Scene("GG_Lurker", edge, c_edge, global.default_entrances);
a = new Scene("GG_Pipeway", water, c_water, global.default_entrances);
a = new Scene("GG_Waterways", water, c_water, global.default_entrances);
a = new Scene("Hive_01", hive, c_hive, global.default_entrances);
a = new Scene("Hive_02", hive, c_hive, global.default_entrances);
a = new Scene("Hive_03", hive, c_hive, global.default_entrances);
a = new Scene("Hive_03_c", hive, c_hive, global.default_entrances);
a = new Scene("Hive_04", hive, c_hive, global.default_entrances);
a = new Scene("Hive_05", hive, c_hive, global.default_entrances);
a = new Scene("Mines_01", peak, c_peak, global.default_entrances);
a = new Scene("Mines_02", peak, c_peak, global.default_entrances);
a = new Scene("Mines_03", peak, c_peak, global.default_entrances);
a = new Scene("Mines_04", peak, c_peak, global.default_entrances);
a = new Scene("Mines_05", peak, c_peak, global.default_entrances);
a = new Scene("Mines_06", peak, c_peak, global.default_entrances);
a = new Scene("Mines_07", peak, c_peak, global.default_entrances);
a = new Scene("Mines_10", peak, c_peak, global.default_entrances);
a = new Scene("Mines_11", peak, c_peak, global.default_entrances);
a = new Scene("Mines_13", peak, c_peak, global.default_entrances);
a = new Scene("Mines_16", peak, c_peak, global.default_entrances);
a = new Scene("Mines_17", peak, c_peak, global.default_entrances);
a = new Scene("Mines_18", peak, c_peak, global.default_entrances);
a = new Scene("Mines_19", peak, c_peak, global.default_entrances);
a = new Scene("Mines_20", peak, c_peak, global.default_entrances);
a = new Scene("Mines_23", peak, c_peak, global.default_entrances);
a = new Scene("Mines_24", peak, c_peak, global.default_entrances);
a = new Scene("Mines_25", peak, c_peak, global.default_entrances);
a = new Scene("Mines_28", peak, c_peak, global.default_entrances);
a = new Scene("Mines_29", peak, c_peak, global.default_entrances);
a = new Scene("Mines_30", peak, c_peak, global.default_entrances);
a = new Scene("Mines_31", peak, c_peak, global.default_entrances);
a = new Scene("Mines_32", peak, c_peak, global.default_entrances);
a = new Scene("Mines_33", roads, c_roads, global.default_entrances);
a = new Scene("Mines_34", peak, c_peak, global.default_entrances);
a = new Scene("Mines_36", peak, c_peak, global.default_entrances);
a = new Scene("Mines_37", peak, c_peak, global.default_entrances);
a = new Scene("RestingGrounds_02", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_04", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_05", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_06", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_08", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_09", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_10", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_12", rest, c_rest, global.default_entrances);
a = new Scene("RestingGrounds_17", rest, c_rest, global.default_entrances);
a = new Scene("Room_Mask_Maker", nest, c_nest, global.default_entrances);
a = new Scene("Ruins_Bathhouse", city, c_city, global.default_entrances);
a = new Scene("Ruins_Elevator", city, c_city, global.default_entrances);
a = new Scene("Ruins1_01", city, c_city, global.default_entrances);
a = new Scene("Ruins1_02", city, c_city, global.default_entrances);
a = new Scene("Ruins1_03", city, c_city, global.default_entrances);
a = new Scene("Ruins1_04", city, c_city, global.default_entrances);
a = new Scene("Ruins1_05", city, c_city, global.default_entrances);
a = new Scene("Ruins1_05b", city, c_city, global.default_entrances);
a = new Scene("Ruins1_05c", city, c_city, global.default_entrances);
a = new Scene("Ruins1_06", city, c_city, global.default_entrances);
a = new Scene("Ruins1_09", city, c_city, global.default_entrances);
a = new Scene("Ruins1_17", city, c_city, global.default_entrances);
a = new Scene("Ruins1_18", city, c_city, global.default_entrances);
a = new Scene("Ruins1_23", city, c_city, global.default_entrances);
a = new Scene("Ruins1_24", city, c_city, global.default_entrances);
a = new Scene("Ruins1_25", city, c_city, global.default_entrances);
a = new Scene("Ruins1_27", city, c_city, global.default_entrances);
a = new Scene("Ruins1_28", city, c_city, global.default_entrances);
a = new Scene("Ruins1_29", city, c_city, global.default_entrances);
a = new Scene("Ruins1_30", city, c_city, global.default_entrances);
a = new Scene("Ruins1_31", city, c_city, global.default_entrances);
a = new Scene("Ruins1_31b", city, c_city, global.default_entrances);
a = new Scene("Ruins1_32", city, c_city, global.default_entrances);
a = new Scene("Ruins2_01", city, c_city, global.default_entrances);
a = new Scene("Ruins2_01_b", city, c_city, global.default_entrances);
a = new Scene("Ruins2_03", city, c_city, global.default_entrances);
a = new Scene("Ruins2_03b", city, c_city, global.default_entrances);
a = new Scene("Ruins2_04", city, c_city, global.default_entrances);
a = new Scene("Ruins2_05", city, c_city, global.default_entrances);
a = new Scene("Ruins2_06", city, c_city, global.default_entrances);
a = new Scene("Ruins2_07", city, c_city, global.default_entrances);
a = new Scene("Ruins2_08", city, c_city, global.default_entrances);
a = new Scene("Ruins2_09", city, c_city, global.default_entrances);
a = new Scene("Ruins2_10", rest, c_rest, global.default_entrances);
a = new Scene("Ruins2_10b", city, c_city, global.default_entrances);
a = new Scene("Ruins2_11", city, c_city, global.default_entrances);
a = new Scene("Ruins2_11_b", city, c_city, global.default_entrances);
a = new Scene("Ruins2_Watcher_Room", city, c_city, global.default_entrances);

a = new Scene("Town", town, c_town, ds_map_create());
a.add_entrance("door_jiji", 391, 151);
a.add_entrance("left1", 2, 86);
a.add_entrance("bot1", 290, 164);
a.add_entrance("door_mapper", 235, 146);
a.add_entrance("right1", 405, 95);
a.add_entrance("door_bretta", 257, 146);
a.add_entrance("door_sly", 178, 146);
a.add_entrance("door_station", 209, 146);
a.add_entrance("top1", 84, 40);

a = new Scene("Tutorial_01", town, c_town, ds_map_create());
a.add_entrance("right1", 296, 32);
a.add_entrance("top1", 28, 11);
a.add_entrance("top2", 9, 11);

a = new Scene("Waterways_01", water, c_water, global.default_entrances);
a = new Scene("Waterways_02", water, c_water, global.default_entrances);
a = new Scene("Waterways_03", water, c_water, global.default_entrances);
a = new Scene("Waterways_04", water, c_water, global.default_entrances);
a = new Scene("Waterways_04b", water, c_water, global.default_entrances);
a = new Scene("Waterways_05", water, c_water, global.default_entrances);
a = new Scene("Waterways_06", water, c_water, global.default_entrances);
a = new Scene("Waterways_07", water, c_water, global.default_entrances);
a = new Scene("Waterways_08", water, c_water, global.default_entrances);
a = new Scene("Waterways_09", water, c_water, global.default_entrances);
a = new Scene("Waterways_12", water, c_water, global.default_entrances);
a = new Scene("Waterways_13", water, c_water, global.default_entrances);
a = new Scene("Waterways_14", water, c_water, global.default_entrances);
a = new Scene("Waterways_15", water, c_water, global.default_entrances);