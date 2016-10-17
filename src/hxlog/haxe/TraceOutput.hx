package hxlog.haxe;

class TraceOutput extends LogOutput {

	public function new() {}

	override public function write(message:Dynamic) {
		Log.nativeTrace.haxeTrace(message);
	}
}