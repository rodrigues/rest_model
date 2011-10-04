# encoding: utf-8

$:.push 'lib'; require 'rest_model'

def inspect_rest_model(element)
  puts "instance:  #{element.inspect}"
  puts "resource:  #{element.resource}"
  puts "to_source: #{element.to_source}"
end
