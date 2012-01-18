# -*- encoding: utf-8 -*-
require File.expand_path('../lib/padrino_gelflogger/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Piotr Zolnierek"]
  gem.email         = ["pz@anixe.pl"]
  gem.description   = %q{Log from Padrino to Graylog2}
  gem.summary       = %q{uses GELF.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "padrino_gelflogger"
  gem.require_paths = ["lib"]
  gem.version       = PadrinoGelflogger::VERSION
end
