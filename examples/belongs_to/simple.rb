$:.push 'examples'; require 'helper'

class Customer < RestModel
  id field: :customer_id, type: Integer
  has_many :services
end

class Service < RestModel
  id type: Integer
  belongs_to :customer
end

@service = Service.new(id: 123, customer_id: 999)

inspect_rest_model(@service)
