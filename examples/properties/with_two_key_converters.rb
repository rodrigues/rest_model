$:.push 'lib'; require 'transcriber'

module Upcasing
  def self.call(keys)
    keys.map {|key| key.to_s.upcase}
  end
end

module Camelizing
  def self.call(keys)
    keys.map {|key| key.to_s.camelize}
  end
end

class Customer < Transcriber::Resource
  convert_input_keys Upcasing
  property :login
  embeds_one :service
end

class Service < Transcriber::Resource
  convert_input_keys Camelizing
  property :key_name
end

root = Customer.parse({"LOGIN" => 2000, "SERVICE" => {"KeyName" => "ehehe"}}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
