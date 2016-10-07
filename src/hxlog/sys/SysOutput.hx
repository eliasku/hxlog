package hxlog.sys;

class SysOutput extends LogOutput {

	public function new() {}

#if (sys||hxnodejs)

	override public function write(message:Dynamic) {
		Sys.println(message);
	}

#end

}