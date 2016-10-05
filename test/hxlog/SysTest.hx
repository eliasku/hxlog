package hxlog;

import hxlog.sys.SysTarget;
import utest.Assert;

class SysTest {

	public function new() {}

	public function setup() {
		Log.manager.add(new SysTarget());
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