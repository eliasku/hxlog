# hxlog
Flexible logging host system for Haxe

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