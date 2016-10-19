package hxlog.logging;

class HaxeTraceLog extends LogBend {

	public function new() {}

	override public function bend(msg:LogMessage) {
		Log.nativeTrace.haxeTrace(msg.text, msg.infos);
	}
}