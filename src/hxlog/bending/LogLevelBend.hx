package hxlog.bending;

class LogLevelBend extends LogBend {

	var _levels:Array<String>;

	public function new() {
		_levels = [];
		_levels[LogLevel.TRACE] = "T/";
		_levels[LogLevel.DEBUG] = "D/";
		_levels[LogLevel.INFO] = "I/";
		_levels[LogLevel.WARNING] = "W/";
		_levels[LogLevel.ERROR] = "E/";
	}

	override public function bend(msg:LogMessage) {
		msg.text = _levels[msg.level] + msg.text;
	}
}
