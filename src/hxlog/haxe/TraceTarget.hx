package hxlog.haxe;

import haxe.PosInfos;

class TraceTarget extends LogTarget {

	var _traceHook:TraceHook;

	public function new(traceHook:TraceHook) {
		_traceHook = traceHook;
	}

	override public function print(message:String, level:LogLevel, infos:PosInfos) {
		_traceHook.trace(getLevelPrefix(level) + message, infos);
	}

	public static function getLevelPrefix(level:LogLevel):String {
		return switch(level) {
			case LogLevel.TRACE: '[TRACE] ';
			case LogLevel.DEBUG: '[DEBUG] ';
			case LogLevel.INFO: '[INFO] ';
			case LogLevel.WARNING: '[WARN] ';
			case LogLevel.ERROR: '[ERROR] ';
			default: '';
		};
	}

	public static function __redirectTrace(message:String, infos:PosInfos) {
		Log.trace(message, infos);
	}
}
