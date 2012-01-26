# PadrinoGelflogger

This gem allows logging to [Graylog](http://graylog2.org/) via [Padrino](padrinorb.com).

## Installation

Add this line to your application's Gemfile:

    gem 'padrino_gelflogger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install padrino_gelflogger

## Usage
In your config/boot.rb add something like this:

    Padrino.after_load do
      if %w[acceptance production].include? PADRINO_ENV
        Padrino.logger = Padrino::GelfLogger.new("graylog-server", 12201, 'wan', :facility => 'AppName', :level => :devel)
      end
    end

You can manually log performance stats using `logger.bench`, for example:

    bench("action", Time.local(2012, 12, 20, 20, 12, 00), "message", level=:debug, color=:yellow, full_message="more info about this run")

## GelfExceptionLogger
In order to log exceptions to [Graylog](http://graylog2.org/) add this to your app.rb:

    register Padrino::GelfExceptionLogger 

For this to work, you __must__ set the Padrino.logger to the Padrino::GelfLogger first!


More information about the parameters can be found at in the  [http://rubydoc.info/github/Graylog2/gelf-rb/master/GELF/Notifier](Graylog2) gem docs. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
