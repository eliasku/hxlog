# hxlog
Logs for Haxe

## Example

```
Log.manager.add(
	new LogTarget()
	.format(new PosInfosFormatter())
	.format(new LogLevelFormatter())
	.format(new AnsiColorsFormatter())
	.out(new SysOutput())
);
```

## Redirect `trace()` calls

```
Log.manager.handleHaxeTrace = true;
```

## TODO
- Browser js.console output
- File output (sys, air3)
- Net output (socket, http)

## TODO: Experimental
- API: Message structure
- API: Pipes as processing graph
