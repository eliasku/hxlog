package hxlog.logging;

class SysLog extends LogBend {

	public function new() {}

	override public function bend(msg:LogMessage) {
#if (sys||hxnodejs)
		Sys.println(msg.text);
#elseif flash
		untyped __global__["trace"](msg.text);
#elseif js
		switch(msg.level) {
			case LogLevel.INFO:
				js.Browser.console.info(msg.text);
			case LogLevel.WARNING:
				js.Browser.console.warn(msg.text);
			case LogLevel.ERROR:
				js.Browser.console.error(msg.text);
			default:
				js.Browser.console.log(msg.text);
		}
#end
	}
}