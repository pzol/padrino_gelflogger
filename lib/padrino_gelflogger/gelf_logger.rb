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

    LevelMappings.each_pair do |name, number|
      define_method(name) do |*args|
        if args.size > 1
          bench(*args)
        else
          push(args * '', name)
        end
      end

      define_method("#{name}?") do
        true
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
    
    def bench(action, began_at, message, level=:debug, color=:yellow, full_message=nil)
      duration = ((Time.now - began_at) * 1000).to_i
      short_message = "(%s %dms) - %s" % [ action, duration, clean(message.to_s) ]
      options = {short_message: short_message, full_message: full_message, _Duration: duration, _Action: action}
      notify_with_level(gelf_level(level), options)
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
