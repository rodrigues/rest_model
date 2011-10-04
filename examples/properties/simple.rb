$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
end

@root = Customer.parse({login: 'jackiechan2010'}).first
inspect_rest_model(@root)
