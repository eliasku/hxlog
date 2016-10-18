package hxlog;

import haxe.PosInfos;

class LogBend {

	/** Perform transform and/or output operations **/
	public function bend(message:Dynamic, level:LogLevel, infos:PosInfos):Dynamic {
		return message;
	}

	/** Clear message **/
	public function clear() {}

	/** Dispose unmanaged resources for this bend **/
	public function dispose() {}
}
