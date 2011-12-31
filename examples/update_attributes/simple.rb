$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
  property :birth, type: Date
end

@root = Customer.from_source!(login: 'jackiechan2010', birth: '2011-01-01').first
@root.update_attributes(login: 'newjackiechan2010', birth: '1986-01-23')

inspect_rest_model(@root)