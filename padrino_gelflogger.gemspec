# -*- encoding: utf-8 -*-
require File.expand_path('../lib/padrino_gelflogger/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Piotr Zolnierek"]
  gem.email         = ["pz@anixe.pl"]
  gem.description   = %q{Log from Padrino to Graylog2}
  gem.summary       = %q{uses GELF.}
  gem.homepage      = "http://github.com/pzol/padrino_gelflogger"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "padrino_gelflogger"
  gem.require_paths = ["lib"]
  gem.version       = PadrinoGelflogger::VERSION
  gem.add_dependency 'gelf', '>=1.3.2'

  gem.add_development_dependency 'minitest', '>=2.10.0'
  gem.add_development_dependency 'minitest-reporters'
  gem.add_development_dependency 'rr'
  gem.add_development_dependency 'timecop'
  gem.add_development_dependency 'rake'
end
