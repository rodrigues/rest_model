$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login, field: :customer_login
end

@root = Customer.from_source(customer_login: 'jackiechan2010').first
inspect_rest_model(@root)
