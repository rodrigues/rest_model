$:.push 'examples'; require 'helper'

class Customer < RestModel
  id type: Integer
  property :login
end

@root = Customer.from_source!(id: 200, login: 'jackiechan2010').first
@root.update_attributes(login: nil)

inspect_rest_model(@root)
