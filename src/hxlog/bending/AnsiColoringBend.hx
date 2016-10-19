package hxlog.bending;

class AnsiColoringBend extends LogBend {

	var _levels:Array<AnsiColor> = [];

	public function new() {
		_levels[LogLevel.TRACE] = AnsiColor.GREY;
		_levels[LogLevel.DEBUG] = AnsiColor.WHITE;
		_levels[LogLevel.INFO] = AnsiColor.CYAN;
		_levels[LogLevel.WARNING] = AnsiColor.YELLOW;
		_levels[LogLevel.ERROR] = AnsiColor.RED;
	}

	override public function bend(msg:LogMessage) {
		msg.text = _levels[msg.level] + msg.text + AnsiColor.RESET;
	}
}
