package hxlog;

import hxlog.haxe.NativeTrace;
import haxe.PosInfos;

@:final
class Log {

	public static var nativeTrace(default, null):NativeTrace = @:privateAccess new NativeTrace();
	public static var manager(default, null):LogManager = new LogManager();

	public inline static function trace(message:Dynamic, ?position:PosInfos) {
		manager.print(message, LogLevel.TRACE, position);
	}

	public inline static function debug(message:Dynamic, ?position:PosInfos) {
		manager.print(message, LogLevel.DEBUG, position);
	}

	public inline static function info(message:Dynamic, ?position:PosInfos) {
		manager.print(message, LogLevel.INFO, position);
	}

	public inline static function warning(message:Dynamic, ?position:PosInfos) {
		manager.print(message, LogLevel.WARNING, position);
	}

	public inline static function error(message:Dynamic, ?position:PosInfos) {
		manager.print(message, LogLevel.ERROR, position);
	}

	public inline static function clear() {
		manager.clear();
	}
}
