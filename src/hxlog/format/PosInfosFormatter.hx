package hxlog.format;

import haxe.PosInfos;

class PosInfosFormatter extends LogFormatter {

	public function new() {}

	override public function format(message:Dynamic, level:LogLevel, infos:PosInfos) {
		return infos.fileName + ":" + infos.lineNumber + " " + message;
	}
}
