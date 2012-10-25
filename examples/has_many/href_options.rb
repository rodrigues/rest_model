$:.push 'examples'; require 'helper'

class Service < RestModel
  property :name
  belongs_to :customer
end

class Customer < RestModel
  id field: :customer_id, type: Integer
  property :login
  has_many :services, href: proc {"http://external.service.com/customers/#{id}/services"}
end

@root = Customer.from_source!(customer_id: 123, login: 'jackiechan2010').first
inspect_rest_model(@root)
