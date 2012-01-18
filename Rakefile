#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'bundler/setup'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
  t.libs << "spec"
  t.verbose = true
end
