$:.push 'lib'; require 'transcriber'

Dir["examples/*/**.rb"].each do |file|
  [:Root, :Item, :Customer, :Entry].each do |klass|
    Object.send(:remove_const, klass) if Object.const_defined? klass
  end

  puts
  puts
  p "example file: #{file}"
  puts
  puts
  load file
end
