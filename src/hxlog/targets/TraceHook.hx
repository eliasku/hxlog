package hxlog.targets;

import haxe.PosInfos;

typedef TraceCallback = Dynamic->PosInfos->Void;

class TraceHook {

	var _enabled:Bool;
	var _traceHaxe:TraceCallback;
	var _traceCallback:TraceCallback;

	public function new(callback:TraceCallback) {
		_traceHaxe = haxe.Log.trace;
		_traceCallback = callback;
		haxe.Log.trace = redirectedTrace;
		_enabled = true;
	}

	function redirectedTrace(message:Dynamic, ?infos:PosInfos) {
		if(_traceCallback != null) {
			_traceCallback(message, infos);
		}
	}

	public function trace(message:Dynamic, ?infos:PosInfos) {
		if(_traceHaxe != null) {
			_traceHaxe(message, infos);
		}
	}

	public function setEnabled(value:Bool) {
		if(_enabled != null) {

		}
		haxe.Log.trace = _traceHaxe;
		_traceCallback = null;
		_traceHaxe = null;
	}
}
