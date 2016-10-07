package hxlog.format;

import haxe.PosInfos;

class AnsiColorsFormatter extends LogFormatter {

	var _levels:Array<AnsiColor>;

	public function new() {
		_levels = [];
		_levels[LogLevel.TRACE] = AnsiColor.GREY;
		_levels[LogLevel.DEBUG] = AnsiColor.WHITE;
		_levels[LogLevel.INFO] = AnsiColor.CYAN;
		_levels[LogLevel.WARNING] = AnsiColor.YELLOW;
		_levels[LogLevel.ERROR] = AnsiColor.RED;
	}

	override public function format(message:Dynamic, level:LogLevel, infos:PosInfos):Dynamic {
		return _levels[level] + message + AnsiColor.RESET;
	}
}
