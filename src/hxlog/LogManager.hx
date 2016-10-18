package hxlog;

import haxe.PosInfos;

@:final
@:access(hxlog.LogPipe)
class LogManager {

	public var handleHaxeTrace:Bool = false;

	var _pipe:LogPipe = new LogPipe();
	var _filter:Int = 0xFFFFFFFF;

	public function new() {
		Log.nativeTrace.add(onHaxeTrace);
	}

	public function print(message:Dynamic, level:LogLevel, ?infos:PosInfos) {
		if(message == null || !level.check(_filter)) {
			return;
		}

		_pipe.run(message, level, infos);
	}

	inline public function branch():LogPipe {
		return _pipe.branch();
	}

	inline public function filter(?levels:Array<LogLevel>) {
		_filter = LogLevel.buildMask(levels);
	}

	public function clear() {
		_pipe.clear();
	}

	public function reset() {
		_pipe.dispose();
		_pipe = new LogPipe();
		_filter = 0xFFFFFFFF;
	}

	public function dispose() {
		reset();
		Log.nativeTrace.remove(onHaxeTrace);
	}

	function onHaxeTrace(message:Dynamic, ?infos:PosInfos) {
		if(handleHaxeTrace) {
			print(message, LogLevel.TRACE, infos);
			return true;
		}
		return false;
	}
}
