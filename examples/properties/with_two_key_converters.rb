$:.push 'examples'; require 'helper'

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

class Customer < RestModel
  convert_input_keys Upcasing
  property :login
  embeds_one :product
end

class Product < RestModel
  convert_input_keys Camelizing
  property :unit_price, type: Float
end

@root = Customer.from_source({"LOGIN" => 'jackiechan2010', "PRODUCT" => {"UnitPrice" => 29.9}}).first
inspect_rest_model(@root)
