module Padrino
  module GelfExceptionLogger

   def self.registered(app)
      app.set :dump_errors, false       # rack crashes when true :(
      app.error 500 do
        raise "Pardino.logger must be set to Padrino::GelfLogger" unless logger.respond_to? :notify!
        err  = env['sinatra.error']
        short_message = "#{err.class} - #{err.message}" 
        full_message = err.backtrace[0..2].join("\n  ")
        full_message += "\n\n---Params:\n"
        params.each { |k,v| full_message += "\n#{k.inspect} => #{v.inspect}" }

        logger.notify({
          :short_message => short_message,
          :full_message => full_message[0..2000], # there is a bug in GELF (1.32), chunking is not working :()
          :level => GELF::Levels::FATAL
        })

        raise
      end
    end

  end
end
