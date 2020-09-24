function foreach(array, func) {
	var length = array_length(array);
	
	for (var i = 0; i < length; i++) {
		func(array[i]);
	}
}