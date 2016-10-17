package hxlog;

import haxe.PosInfos;

@:final
class LogManager {

	public var handleHaxeTrace:Bool = false;

	var _filter:Int = 0xFFFFFFFF;
	var _targets:Array<LogTarget> = [];

	public function new() {
		Log.nativeTrace.add(onHaxeTrace);
	}

	public function add(target:LogTarget) {
		if(target == null) throw "Invalid argument";

		_targets.push(target);
	}

	// TODO: remove / removeAll ?

	public function print(message:Dynamic, level:LogLevel, ?infos:PosInfos) {
		if(message == null || !level.check(_filter)) {
			return;
		}

		for(target in _targets) {
			target.print(message, level, infos);
		}
	}

	inline public function filter(?levels:Array<LogLevel>) {
		_filter = LogLevel.buildMask(levels);
	}

	public function clear() {
		for(target in _targets) {
			target.clear();
		}
	}

	public function reset() {
		for(target in _targets) {
			target.dispose();
		}
		_targets = [];
		_filter = 0xFFFFFFFF;
	}

	public function dispose() {
		reset();
		Log.nativeTrace.remove(onHaxeTrace);
	}

	function onHaxeTrace(message:Dynamic, ?infos:PosInfos) {
		if(handleHaxeTrace && _targets.length > 0) {
			print(message, LogLevel.TRACE, infos);
			return true;
		}
		return false;
	}
}
