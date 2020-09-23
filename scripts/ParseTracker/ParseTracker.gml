global.seed = -1;

function parse_tracker(path) {
	//If it can't locate the default path for the log
	if (!file_exists(path)) {
		show_message("Couldn't locate the randomizer log!\nPlease select the file from your computer.");
		path = get_open_filename("Text Files (*.txt)|*.txt", "RandomizerTrackerLog.txt");
	}
	
	var file = file_text_open_read(path);
	var transitions = ds_list_create();
	
	//Reads every single line to load all transitions of the tracker
	while (!file_text_eof(file)) {
		var line = file_text_readln(file);
		
		if (string_copy(line, 1, 6) == "Seed: ") {
			try {
				global.seed = real(string_copy(line, 6, string_length(line) - 6));
			} catch (ex) {
				show_message("There was an error parsing the seed!");
				game_end();
			}
			
			continue;
		}
		
		//Skip if it's not a transition line
		if (string_copy(line, 1, 15) != "TRANSITION --- " || string_length(line) < 16) {
			continue;
		}
		
		//Remove all the unnecessary text
		line = string_replace(line, "TRANSITION --- ", "");
		line = string_replace(line, "-->", "");
		line = string_replace_all(line, "{", "");
		line = string_replace_all(line, "}", "");
		line = string_replace(line, "\n", "");
		
		line_extract = function(text, char, index) {
			var extracted = "";
			var current = "";
			
			while (true) {
				current = string_copy(text, index++, 1);
				
				if (current == char || current == "") {
					break;
				}
				
				extracted += current;
			}
			
			return {
				extract: extracted,
				idx: index
			};
		}
		
		//From transition
		var extracted = line_extract(line, "[", 1);
		var name1 = extracted.extract;
		var index = extracted.idx;
		
		extracted = line_extract(line, "]", index);
		var entrance1 = extracted.extract;
		index = extracted.idx;
		
		//To transition
		extracted = line_extract(line, "[", index);
		var name2 = extracted.extract;
		index = extracted.idx;
		
		var entrance2 = line_extract(line, "]", index).extract;
		
		//Add from transition
		var transition = {
			name: name1,
			entrance: entrance1
		};
		
		ds_list_add(transitions, transition);
		
		//Add to transition
		transition = {
			name: name2,
			entrance: entrance2
		};
		
		ds_list_add(transitions, transition);
	}
	
	file_text_close(file);
	return transitions;
}