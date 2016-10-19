package hxlog;

import haxe.PosInfos;

/**
	Message is mutable in context of Bends
	Message data which is immutable for all pipes (each pipe has own copy of message),
	but
**/
@:final
class LogMessage {

	public var text:String;
	public var level:LogLevel;
	public var infos:PosInfos;

	public function new() {}

	public function copyFrom(msg:LogMessage) {
		text = msg.text;
		level = msg.level;
		infos = msg.infos;
	}
}
