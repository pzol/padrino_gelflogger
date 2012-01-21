## v0.1.2
- changed `bench` log format to: (action 1000ms) - short_message' 
- bench now can all take the full_message for graylog

    bench("action", Time.local(2012, 12, 20, 20, 12, 00), "message", level=:debug, color=:yellow, full_message="full")

the color is not logged, but required for compatibility.

## v0.1.1
- remove dependencies from padrino-core.gem
