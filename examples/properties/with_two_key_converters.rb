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
  embeds_one :product
end

class Product < Transcriber::Resource
  convert_input_keys Camelizing
  property :unit_price, type: Float
end

@root = Customer.parse({"LOGIN" => 'jackiechan2010', "PRODUCT" => {"UnitPrice" => 29.9}}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
