$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :name
  property :birth, type: Date
end

@root = Customer.new(name: "Jackie Chan", birth: "1986-01-23")
inspect_rest_model(@root)
