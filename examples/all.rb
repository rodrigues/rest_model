$:.push 'lib'; require 'transcriber'

Dir["examples/*/**.rb"].each do |file|
  [:Root, :Item, :Customer, :Entry, :Service].each do |klass|
    Object.send(:remove_const, klass) if Object.const_defined? klass
  end

  puts "\n\nexample file: #{file}\n\n"
  load file
end
