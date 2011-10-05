$:.push 'examples'; require 'helper'

class Customer < RestModel
  id
end

@root = Customer.from_source(id: 2000).first
inspect_rest_model(@root)
