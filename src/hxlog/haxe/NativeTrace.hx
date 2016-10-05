package hxlog.haxe;

import haxe.PosInfos;

class NativeTrace {

	var _haxeTrace:Dynamic -> ?haxe.PosInfos -> Void;
	var _handlers:Array<TraceHandler> = [];

	function new() {
		_haxeTrace = haxe.Log.trace;
		haxe.Log.trace = traceInput;
	}

	public function haxeTrace(message:Dynamic, ?infos:PosInfos) {
		if (_haxeTrace != null) {
			_haxeTrace(message, infos);
		}
	}

	inline public function add(handler:TraceHandler) {
		_handlers.push(handler);
	}

	inline public function remove(handler:TraceHandler) {
		_handlers.remove(handler);
	}

	function traceInput(message:Dynamic, ?infos:PosInfos) {
		var redirected = false;
		for (handler in _handlers) {
			redirected = redirected || handler(message, infos);
		}

		if(!redirected) {
			haxeTrace(message, infos);
		}
	}
}
