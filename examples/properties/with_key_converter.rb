$:.push 'examples'; require 'helper'

module Upcasing
  def self.call(keys)
    keys.map {|key| key.to_s.upcase}
  end
end

RestModel::Configuration.configure do |c|
  c.convert_input_keys = Upcasing
end

class Customer < RestModel
  property :login
end

@root = Customer.from_source("LOGIN" => 'jackiechan2010').first
inspect_rest_model(@root)
