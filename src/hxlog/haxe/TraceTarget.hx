package hxlog.haxe;

import haxe.PosInfos;

class TraceTarget extends LogTarget {

	var _levels:Array<String> = [];

	public function new() {
		_levels[LogLevel.TRACE] = "[T] ";
		_levels[LogLevel.DEBUG] = "[D] ";
		_levels[LogLevel.INFO] = "[I] ";
		_levels[LogLevel.WARNING] = "[W] ";
		_levels[LogLevel.ERROR] = "[E] ";
	}

	override public function print(message:String, level:LogLevel, infos:PosInfos) {
		Log.outTrace.haxeTrace(_levels[level] + message, infos);
	}
}
