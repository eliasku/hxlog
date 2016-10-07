package hxlog;

import hxlog.format.AnsiColorsFormatter;
import hxlog.format.LogLevelFormatter;
import hxlog.format.PosInfosFormatter;
import hxlog.sys.SysOutput;
import utest.Assert;

class SysTest {

	public function new() {}

	public function setup() {
		var target = new LogTarget()
		.format(new PosInfosFormatter())
		.format(new LogLevelFormatter())
		.format(new AnsiColorsFormatter())
		.out(new SysOutput());
		Log.manager.add(target);
	}

	public function testLog() {
		Log.trace("Just tracing around");
		trace("trace() is handled by Haxe");

		Log.manager.handleHaxeTrace = true;
		trace("trace() redirected to hxlog");
		Log.debug("This is debug message");
		Log.info("Important information");
		Log.warning("Emphesize warning");
		Log.error("Something bad happened");
		Assert.pass("Asdasd");
	}

	public function teardown() {
		Log.manager.reset();
		Log.manager.handleHaxeTrace = false;
	}
}