package hxlog;

import haxe.PosInfos;

@:final
@:access(hxlog.LogPipe)
class LogManager {

	public var handleHaxeTrace(get, set):Bool;

	var _pipe:LogPipe = new LogPipe();
	var _filter:Int = 0xFFFFFFFF;
	var _traceSubscription:Void -> Void;

	public function new() {}

	public function print(message:Dynamic, level:LogLevel, ?infos:PosInfos) {
		if (message == null || !level.check(_filter)) {
			return;
		}

		_pipe._msg.text = message;
		_pipe._msg.level = level;
		_pipe._msg.infos = infos;
		_pipe.run();
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
		handleHaxeTrace = false;
	}

	function onHaxeTrace(message:Dynamic, ?infos:PosInfos) {
		if (handleHaxeTrace) {
			print(message, LogLevel.TRACE, infos);
			return true;
		}
		return false;
	}

	function set_handleHaxeTrace(value:Bool):Bool {
		if (value && _traceSubscription == null) {
			_traceSubscription = Log.nativeTrace.on(onHaxeTrace);
		}
		else if (!value && _traceSubscription != null) {
			_traceSubscription();
			_traceSubscription = null;
		}
		return value;
	}

	inline function get_handleHaxeTrace():Bool {
		return _traceSubscription != null;
	}
}
