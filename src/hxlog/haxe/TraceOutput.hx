package hxlog.haxe;

class TraceOutput extends LogOutput {

	override public function write(message:Dynamic) {
		Log.nativeTrace.haxeTrace(message, null);
	}

}
