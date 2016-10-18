package hxlog.bending;

import haxe.PosInfos;

class PosInfosBend extends LogBend {

	public function new() {}

	override public function bend(message:Dynamic, level:LogLevel, infos:PosInfos):Dynamic {
		return infos.fileName + ":" + infos.lineNumber + " " + message;
	}
}
