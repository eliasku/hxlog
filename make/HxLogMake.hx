package ;

import hxmake.haxelib.HaxelibExt;
import hxmake.test.TestTask;
import hxmake.idea.IdeaPlugin;
import hxmake.haxelib.HaxelibPlugin;

using hxmake.haxelib.HaxelibPlugin;

class HxLogMake extends hxmake.Module {

	function new() {
		config.classPath = ["src"];
		config.testPath = ["test"];
		config.devDependencies = [
			"utest" => "haxelib"
		];

		apply(HaxelibPlugin);
		apply(IdeaPlugin);

		library(
			function(ext:HaxelibExt) {
				ext.config.description = "Log system for Haxe";
				ext.config.contributors = ["eliasku"];
				ext.config.url = "https://github.com/eliasku/hxlog";
				ext.config.license = "MIT";
				ext.config.version = "0.1.0";
				ext.config.releasenote = "New API changes, bends/pipes";
				ext.config.tags = ["utility", "log", "debug", "sys"];

				ext.pack.includes = ["src", "haxelib.json", "README.md", "LICENSE"];
			}
		);

		var tt = new TestTask();
		tt.targets = ["interp", "neko", "swf", "js", "node", "cpp", "java", "cs"];
		tt.libraries = ["hxlog"];
		task("test", tt);
	}
}