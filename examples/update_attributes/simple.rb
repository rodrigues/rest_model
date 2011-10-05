$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
end

@root = Customer.parse({login: 'jackiechan2010'}).first
@root.update_attributes(login: 'newjackiechan2010')

inspect_rest_model(@root)