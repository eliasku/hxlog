package hxlog;

import hxlog.format.LogFormatter;
import haxe.PosInfos;

@:final
class LogTarget {

	var _outputs:Array<LogOutput> = [];
	var _formatters:Array<LogFormatter> = [];

	inline public function new() {}

	inline public function format(formatter:LogFormatter):LogTarget {
		_formatters.push(formatter);
		return this;
	}

	inline public function out(output:LogOutput):LogTarget {
		_outputs.push(output);
		return this;
	}

	public function print(message:Dynamic, level:LogLevel, infos:PosInfos) {
		var data = message;
		for(formatter in _formatters) {
			data = formatter.format(data, level, infos);
		}
		for(output in _outputs) {
			output.write(data);
		}
	}

	public function clear() {}
	public function dispose() {}
}
