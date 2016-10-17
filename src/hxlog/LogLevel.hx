package hxlog;

@:enum abstract LogLevel(Int) to Int {

	var TRACE = 0;
	var DEBUG = 1;
	var INFO = 2;
	var WARNING = 3;
	var ERROR = 4;

	inline public function mask():Int {
		return (1 << this);
	}

	inline public function check(filter:Int):Bool {
		return (filter & mask()) != 0;
	}

	public static function buildMask(?levels:Array<LogLevel>):Int {
		if(levels == null) {
			return 0xFFFFFFFF;
		}
		var result = 0;
		for(level in levels) {
			result |= level.mask();
		}
		return result;
	}
}
