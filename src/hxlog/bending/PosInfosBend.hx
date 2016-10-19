package hxlog.bending;

class PosInfosBend extends LogBend {

	public function new() {}

	override public function bend(msg:LogMessage) {
		msg.text = msg.infos.fileName + ":" + msg.infos.lineNumber + " " + msg.text;
	}
}
