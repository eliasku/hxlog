package hxlog;

import haxe.PosInfos;

class LogTarget {
	public function print(message:Dynamic, level:LogLevel, infos:PosInfos) {}
	public function clear() {}
	public function dispose() {}
}
