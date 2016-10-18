package hxlog.logging;

import haxe.PosInfos;

class SysLog extends LogBend {

	public function new() {}

	override public function bend(message:Dynamic, level:LogLevel, infos:PosInfos):Dynamic {
#if (sys||hxnodejs)
		Sys.println(message);
#elseif flash
		untyped __global__["trace"](message);
#end
		return message;
	}
}