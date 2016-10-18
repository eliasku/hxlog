package hxlog.logging;

import haxe.PosInfos;

class SysLog extends LogBend {

	public function new() {}

	override public function bend(message:Dynamic, level:LogLevel, infos:PosInfos):Dynamic {
#if (sys||hxnodejs)
		Sys.println(message);
#elseif flash
		untyped __global__["trace"](message);
#elseif js
		switch(level) {
			case LogLevel.INFO:
				js.Browser.console.info(message);
			case LogLevel.WARNING:
				js.Browser.console.warn(message);
			case LogLevel.ERROR:
				js.Browser.console.error(message);
			default:
				js.Browser.console.log(message);
		}
#end
		return message;
	}
}