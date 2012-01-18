$LOAD_PATH.unshift(File.dirname(__FILE__))
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require File.expand_path '../../lib/padrino_gelflogger', __FILE__

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/spec'
require 'timecop'

require 'rr'



class MockSpec < MiniTest::Spec
   include RR::Adapters::RRMethods
end
MiniTest::Spec.register_spec_type(/.*/, MockSpec)

require 'minitest/reporters'
MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::SpecReporter.new
