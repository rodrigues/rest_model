$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :products, type: Enumerable
end

@root = Customer.from_source(products: ['a', 'b', 'c']).first
inspect_rest_model(@root)
