module Padrino
  class GelfLogger < GELF::Notifier
    attr_accessor :level
  
    LevelMappings = {
        fatal: 4,
        error: 3,
        warn:  2,
        info:  1,
        debug: 0,
        devel: 0 
      }

    Padrino::Logger::Levels.each_pair do |name, number|
      define_method(name) do |*args|
        if args.size > 1
          bench(*args)
        else
          push(args * '', name)
        end
      end
    end
    
    def log(*args)
    end

    def log_static(*args)
    end
    
    def push(message = nil, level = nil)
      msg = clean(message.to_s.strip)
      return if message.empty?
      notify_with_level(gelf_level(level), msg)
    end
    
    def bench(action, began_at, message, level=:debug, color=:yellow)
      duration = Time.now - began_at
      short_message = "%s %0.4fms: %s" % [ action, duration, clean(message.to_s) ]
      notify_with_level(gelf_level(level), short_message: short_message, _duration: duration, _action: action)
    end
    
    private
    def clean(message)
      message = message.to_s.dup
      message.strip!
      message.gsub!(/\e\[[^m]*m/, '') # remove useless ansi color codes
      return message
    end

    def gelf_level(level=nil)
      level = :debug if level.nil?
      LevelMappings[level] || 0
    end
    
  end
end
