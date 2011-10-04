$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :products, type: Enumerable
end

@root = Customer.parse({products: ['a', 'b', 'c']}).first
inspect_rest_model(@root)
