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


More information about the parameters can be found at in the  [http://rubydoc.info/github/Graylog2/gelf-rb/master/GELF/Notifier](Graylog2) gem docs. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
