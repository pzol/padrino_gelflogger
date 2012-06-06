require 'spec_helper'

describe Padrino::GelfLogger do
  include RR::Adapters::MiniTest
  padrino_levels = [:fatal, :error, :warn, :info, :debug, :devel]

  attr_reader :logger

  before do
    @logger = Padrino::GelfLogger.new('0.0.0.0', 12201, 'WAN', :facility => 'Padrino::GelfLogger', :level => GELF::DEBUG)
  end

  it "#fatal" do
    mock(logger).notify_with_level(4, "test")
    logger.fatal "test"
  end

  it "#error" do
    mock(logger).notify_with_level(3, "test")
    logger.error "test"
  end

  it "#warn" do
    mock(logger).notify_with_level(2, "test")
    logger.warn "test"
  end

  it "#info" do
    mock(logger).notify_with_level(1, "test")
    logger.info "test"
  end

  it "#debug" do
    mock(logger).notify_with_level(0, "test")
    logger.debug "test"
  end

  it "#devel" do
    mock(logger).notify_with_level(0, "test")
    logger.devel "test"
  end

  %w{fatal error warn info debug devel}.each do |supported_level|
    it "supports ##{supported_level}?" do
      assert logger.public_send("#{supported_level}?")
    end
  end

  it '#<<' do
    mock(logger).notify_with_level(logger.level, 'test')
    logger << 'test'
  end

  it '#bench' do
    mock(logger).notify_with_level(0, {short_message: '(action 1000ms) - short_message', full_message: nil, _Duration: 1000, _Action: 'action'})
    Timecop.freeze(Time.local(2012, 12, 20, 20, 12, 1)) do
      logger.bench("action", Time.local(2012, 12, 20, 20, 12, 00), "short_message", level=:debug, color=:yellow)
    end
  end

  it '#bench with optional full_message' do
    mock(logger).notify_with_level(0, {short_message: '(action 1000ms) - message', full_message: "full", _Duration: 1000, _Action: 'action'})
    Timecop.freeze(Time.local(2012, 12, 20, 20, 12, 1)) do
      logger.bench("action", Time.local(2012, 12, 20, 20, 12, 00), "message", level=:debug, color=:yellow, full_message="full")
    end
  end

  it 'should respond to #log_static for sinatra and not log anything' do
    assert_respond_to logger, :log_static
  end

  it 'should respond to #log and not log anything' do
    assert_respond_to logger, :log
  end

end
