package hxlog;

import haxe.PosInfos;

@:final
class LogPipe {

	var _bends:Array<LogBend> = [];
	var _pipes:Array<LogPipe> = [];

	function new() {}

	function run(message:Dynamic, level:LogLevel, infos:PosInfos) {
		for (bend in _bends) {
			message = bend.bend(message, level, infos);
		}
		for (pipe in _pipes) {
			pipe.run(message, level, infos);
		}
	}

	/** Dispose unmanaged resources for this bend **/
	function dispose() {
		for (pipe in _pipes) {
			pipe.dispose();
		}
		for (bend in _bends) {
			bend.dispose();
		}
	}

	/** Clear message **/
	function clear() {
		for (pipe in _pipes) {
			pipe.clear();
		}
		for (bend in _bends) {
			bend.clear();
		}
	}

	public function branch():LogPipe {
		var pipe = new LogPipe();
		_pipes.push(pipe);
		return pipe;
	}

	public function bend(b:LogBend):LogPipe {
		if(b == null) throw "Invalid argument";
		_bends.push(b);
		return this;
	}
}
