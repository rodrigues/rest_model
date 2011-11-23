$:.push 'examples'; require 'helper'

class Customer < RestModel
  id field: :customer_id, type: Integer
  has_many :services
end

class Service < RestModel
  id type: Integer
  belongs_to :customer
  property :customer_id, field: :client_id, type: Integer
end

@service = Service.from_source(id: 123, client_id: 999).first

inspect_rest_model(@service)
