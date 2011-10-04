$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login, field: :customer_login
end

@root = Customer.parse({customer_login: 'jackiechan2010'}).first
inspect_rest_model(@root)
