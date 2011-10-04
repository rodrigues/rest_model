$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
end

@customers = Customer.parse([{login: "jackiechan2010"},
                             {login: "brucelee"},
                             {login: "vcr2"}])

@customers.map(&method(:inspect_rest_model))
