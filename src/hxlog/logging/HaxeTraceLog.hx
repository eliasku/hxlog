package hxlog.logging;

import haxe.PosInfos;

class HaxeTraceLog extends LogBend {

	public function new() {}

	override public function bend(message:Dynamic, level:LogLevel, infos:PosInfos):Dynamic {
		Log.nativeTrace.haxeTrace(message);
		return message;
	}
}