package hxlog;

@:enum abstract LogLevel(Int) from Int to Int {
	var TRACE = 0;
	var DEBUG = 1;
	var INFO = 2;
	var WARNING = 3;
	var ERROR = 4;
}
