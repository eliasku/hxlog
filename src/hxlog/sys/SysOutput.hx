package hxlog.sys;

class SysOutput extends LogOutput {

	public function new() {}

	override public function write(message:Dynamic) {
#if (sys||hxnodejs)
		Sys.println(message);
#elseif flash
		untyped __global__["trace"](message);
#end
	}
}