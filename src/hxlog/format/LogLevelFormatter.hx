package hxlog.format;

import haxe.PosInfos;

class LogLevelFormatter extends LogFormatter {

	var _levels:Array<String>;

	public function new() {
		_levels = [];
		_levels[LogLevel.TRACE] = "T/";
		_levels[LogLevel.DEBUG] = "D/";
		_levels[LogLevel.INFO] = "I/";
		_levels[LogLevel.WARNING] = "W/";
		_levels[LogLevel.ERROR] = "E/";
	}

	override public function format(message:Dynamic, level:LogLevel, infos:PosInfos) {
		return _levels[level] + message;
	}
}
