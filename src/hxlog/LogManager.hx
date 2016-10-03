package hxlog;

@:final
class LogManager {

	var _targets:Array<LogTarget> = [];

	public function new() {

	}

	public function print(message:Dynamic, level:LogLevel, ?pos:haxe.PosInfos) {

	}
}
