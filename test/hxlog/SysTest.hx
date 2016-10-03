package hxlog;

import hxlog.targets.SysTarget;
import utest.Assert;

class SysTest {

	public function new() {
		Log.manager.add(new SysTarget());
	}

	public function testLog() {
		Log.trace("Just tracing around");
		trace("Haxe trace redirected to hxlog");
		Log.debug("This is debug message");
		Log.info("Important information");
		Log.warning("Emphesize warning");
		Log.error("Something bad happened");
		Assert.pass();
	}
}
