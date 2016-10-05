package hxlog.sys;

import haxe.PosInfos;

class SysTarget extends LogTarget {

	#if (sys||hxnodejs)

	var _levelLabels:Array<String>;
	var _levelColors:Array<AnsiColor>;
	var _ansiColors:Map<String, String>;
	var _colored:Bool = true;

	public function new() {
		_levelLabels = [];
		_levelLabels[LogLevel.TRACE] = "[TRACE]";
		_levelLabels[LogLevel.DEBUG] = "[DEBUG]";
		_levelLabels[LogLevel.INFO] = "[INFO]";
		_levelLabels[LogLevel.WARNING] = "[WARN]";
		_levelLabels[LogLevel.ERROR] = "[ERROR]";

		_levelColors = [];
		_levelColors[LogLevel.TRACE] = AnsiColor.GREY;
		_levelColors[LogLevel.DEBUG] = AnsiColor.WHITE;
		_levelColors[LogLevel.INFO] = AnsiColor.CYAN;
		_levelColors[LogLevel.WARNING] = AnsiColor.YELLOW;
		_levelColors[LogLevel.ERROR] = AnsiColor.RED;
	}

	override public function print(message:Dynamic, level:LogLevel, infos:PosInfos) {
		var text = _levelLabels[level] + " " + infos.fileName + ":" + infos.lineNumber + " " + Std.string(message);
		if (_colored) {
			text = _levelColors[level] + text + AnsiColor.RESET;
		}
		Sys.println(text);
	}

	#else

	public function new() {}

	#end
}

