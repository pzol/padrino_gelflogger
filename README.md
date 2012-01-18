# PadrinoGelflogger

This gem allows logging to Graylog via [Padrino](padrinorb.com)

## Installation

Add this line to your application's Gemfile:

    gem 'padrino_gelflogger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install padrino_gelflogger

## Usage
In your config/boot.rb add something like this:

    @@@ruby
    Padrino.after_load do
      if %w[acceptance production].include? PADRINO_ENV
        Padrino.logger = Padrino::GelfLogger.new("graylog-server", 12201, 'wan', :facility => 'AppName', :level => :devel)
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
