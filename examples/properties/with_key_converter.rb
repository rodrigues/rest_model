$:.push 'lib'; require 'transcriber'

module Upcasing
  def self.call(keys)
    keys.map {|key| key.to_s.upcase}
  end
end

Transcriber.configure do |c|
  c.convert_input_keys = Upcasing
end

class Customer < Transcriber::Resource
  property :login
end

@root = Customer.parse({"LOGIN" => 'jackiechan2010'}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
