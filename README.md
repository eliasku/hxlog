# hxlog
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
