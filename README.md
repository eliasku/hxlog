# hxlog

[![Lang](https://img.shields.io/badge/language-haxe-orange.svg)](http://haxe.org)
[![Version](https://img.shields.io/badge/version-v0.1.0-green.svg)](https://github.com/eliasku/hxlog)
[![Dependencies](https://img.shields.io/badge/dependencies-none-green.svg)](https://github.com/eliasku/hxlog/blob/develop/haxelib.json)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)

[![Build Status](https://travis-ci.org/eliasku/hxlog.svg?branch=develop)](https://travis-ci.org/eliasku/hxlog)
[![Build Status](https://ci.appveyor.com/api/projects/status/jtd0tlm2u1pr8i4g?svg=true)](https://ci.appveyor.com/project/eliasku/hxlog)

Logs for Haxe

## Lesson #1: Cool bends

```
Log.manager.branch()
	.bend(new PosInfosBend())
	.bend(new LogLevelBend())
	.bend(new AnsiColoringBend())
	.bend(new SysLog());
```

## Redirect `trace()` calls

```
Log.manager.handleHaxeTrace = true;
```

## TODO
- Simplify API
- Advanced messages, discards
- Default platform configuration
- Files output (sys, air3)
- Remote output (socket, http)
