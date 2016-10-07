package hxlog.format;

import haxe.PosInfos;

class LogFormatter {
	public function format(message:Dynamic, level:LogLevel, infos:PosInfos):Dynamic {
		return message;
	}
}
