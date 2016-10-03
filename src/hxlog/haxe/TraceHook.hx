package hxlog.haxe;

import haxe.PosInfos;

typedef TraceCallback = Dynamic->?PosInfos->Void;

class TraceHook {

	var _traceHaxe:TraceCallback;
	var _traceCallback:TraceCallback;
	var _enabled:Bool = true;

	public function new(callback:TraceCallback) {
		_traceHaxe = haxe.Log.trace;
		_traceCallback = callback;
		haxe.Log.trace = redirectedTrace;
	}

	function redirectedTrace(message:Dynamic, ?infos:PosInfos) {
		if(!_enabled) {
			nativeTrace(message, infos);
			return;
		}

		if(_traceCallback != null) {
			_traceCallback(message, infos);
		}
	}

	public function nativeTrace(message:Dynamic, ?infos:PosInfos) {
		if(_traceHaxe != null) {
			_traceHaxe(message, infos);
		}
	}

	public function enable(value:Bool) {
		_enabled = value;
	}
}
