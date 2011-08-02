$:.push 'lib'; require 'transcriber'

module Upcasing
  def self.call(keys)
    keys.map {|key| key.to_s.upcase}
  end
end

Transcriber::Resource.convert_input_keys = Upcasing

class Customer < Transcriber::Resource
  property :login
end

root = Customer.parse({"LOGIN" => 2000}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
