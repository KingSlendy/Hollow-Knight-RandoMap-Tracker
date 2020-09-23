function TargetAnim(start, width, target) constructor {
	self.start = start;
	self.width = width;
	self.target = target;
	pos = target;
	value = start;
	
	add_target = function(amount) {
		pos = lerp(pos, target, amount);
		return self.start + self.width * pos;
	}
}