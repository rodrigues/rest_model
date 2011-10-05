# encoding: utf-8

$:.push 'examples'; require 'helper'

Dir["examples/*/**.rb"].each do |file|
  [:Root, :Item, :Customer, :Entry, :Service].each do |klass|
    Object.send(:remove_const, klass) if Object.const_defined? klass
  end

  RestModel::Configuration.configure do |c|
    c.convert_input_keys = RestModel::Configuration::DefaultHandler
  end

  puts "\n\nexample file: #{file}\n\n"
  load file
end
