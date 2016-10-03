package hxlog;

@:enum abstract LogLevel(Int) to Int {

	var TRACE = 0;
	var DEBUG = 1;
	var INFO = 2;
	var WARNING = 3;
	var ERROR = 4;

	inline public function mask():Int {
		return 1 << this;
	}
}
