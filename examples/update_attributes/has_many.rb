$:.push 'examples'; require 'helper'

class Service < RestModel
  property :name
  belongs_to :customer
end

class Customer < RestModel
  id field: :customer_id, type: Integer
  property :login
  has_many :services
end

@root = Customer.from_source!(customer_id: 123, login: 'jackiechan2010').first
@root.update_attributes(services: [{name: "new_service_name"}])

inspect_rest_model(@root)
