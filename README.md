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
- Message structure, message pool, cloning, discards
- Browser js.console output
- File output (sys, air3)
- Net output (socket, http)
