package hxlog;

import hxlog.targets.TraceHook;
import haxe.PosInfos;

@:final
class LogManager {

	public var traceHook(default, null):TraceHook;

	var _targets:Array<LogTarget>;
	var _filter:Int;

	public function new() {
		reset();
		traceHook = new TraceHook(Log.trace);
	}

	public function add(target:LogTarget) {
		if(target == null) throw "Invalid argument";

		_targets.push(target);
	}

	public function print(message:Dynamic, level:LogLevel, ?pos:PosInfos) {
		if(message == null || (_filter & (1 << level)) == 0) {
			return;
		}

		for(target in _targets) {
			target.print(message, level, pos);
		}
	}

	public function filter(?levels:Array<LogLevel>) {
		if(levels == null) {
			_filter = 0xFFFFFFFF;
			return;
		}
		_filter = 0;
		for(level in levels) {
			_filter |= 1 << level;
		}
	}

	public function reset() {
		_targets = [];
		_filter = 0xFFFFFFFF;
	}
}
