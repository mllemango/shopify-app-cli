begin
  addpath = lambda do |p|
    path = File.expand_path("../../#{p}", __FILE__)
    $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
  end
  addpath.call("lib")
  addpath.call("vendor/lib")
end

ENV['RUNNING_SHOPIFY_CLI_TESTS'] = 1.to_s

require 'rubygems'
require 'bundler/setup'
require 'shopify_cli'
require 'byebug'
require 'pry'

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'test_helpers'
require_relative 'minitest_ext'
require 'fakefs/safe'
require 'webmock/minitest'

require 'mocha/minitest'
require 'minitest/reporters'

# reporter_options = { color: true }
# Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
# Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
