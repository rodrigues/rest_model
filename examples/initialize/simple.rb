$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :name
end

@root = Customer.new(name: "Jackie Chan")
inspect_rest_model(@root)
