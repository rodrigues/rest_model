$:.push 'examples'; require 'helper'

class Billing < RestModel
  property :login
  belongs_to :customer
end

class Customer < RestModel
  id field: :customer_id, type: Integer
  property :login
  has_one  :billing, href: proc {"http://external.service.com/customers/#{id}/billing"}
end

@root = Customer.from_source!(customer_id: 123, login: 'jackiechan2010').first
inspect_rest_model(@root)
