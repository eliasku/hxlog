package hxlog.targets;

import haxe.PosInfos;

class SysTarget extends LogTarget {

	var _levelLabels:Array<String>;
	var _levelColors:Array<String>;
	var _resetColors:String;
	var _ansiColors:Map<String, String>;

	public function new() {
		_levelLabels = [];
		_levelLabels[LogLevel.TRACE] = "[TRACE]";
		_levelLabels[LogLevel.DEBUG] = "[DEBUG]";
		_levelLabels[LogLevel.INFO] = "[INFO]";
		_levelLabels[LogLevel.WARNING] = "[WARN]";
		_levelLabels[LogLevel.ERROR] = "[ERROR]";

		_ansiColors = new Map<String, String>();
		_ansiColors['black'] = '\033[0;30m';
		_ansiColors['red'] = '\033[31m';
		_ansiColors['green'] = '\033[32m';
		_ansiColors['yellow'] = '\033[33m';
		_ansiColors['blue'] = '\033[1;34m';
		_ansiColors['magenta'] = '\033[1;35m';
		_ansiColors['cyan'] = '\033[0;36m';
		_ansiColors['grey'] = '\033[0;37m';
		_ansiColors['white'] = '\033[1;37m';
		_ansiColors['reset'] = '\033[0m';

		_levelColors = [];
		_levelColors[LogLevel.TRACE] = _ansiColors['grey'];
		_levelColors[LogLevel.DEBUG] = _ansiColors['white'];
		_levelColors[LogLevel.INFO] = _ansiColors['cyan'];
		_levelColors[LogLevel.WARNING] = _ansiColors['yellow'];
		_levelColors[LogLevel.ERROR] = _ansiColors['red'];
		_resetColors = _ansiColors["reset"];
	}

	override public function print(message:Dynamic, level:LogLevel, infos:PosInfos) {
		var text = infos.fileName + ":" + infos.lineNumber + " " + _levelLabels[level] + " " + Std.string(message);
		// colors
		if(true) {
			text = _levelColors[level] + text + _resetColors;
		}
		Sys.println(text);
	}

	public static function getLevelPrefix(level:LogLevel):String {
		return switch(level) {
			case LogLevel.TRACE: '[TRACE]';
			case LogLevel.DEBUG: '[DEBUG]';
			case LogLevel.INFO: '[INFO]';
			case LogLevel.WARNING: '[WARN]';
			case LogLevel.ERROR: '[ERROR]';
			default: '';
		};
	}

	public static function internalTrace(message:String, infos:PosInfos) {
		Log.trace(message, infos);
	}
}