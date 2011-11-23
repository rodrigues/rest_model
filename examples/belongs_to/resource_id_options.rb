$:.push 'examples'; require 'helper'

class Customer < RestModel
  id field: :customer_id, type: Integer
  has_many :services
end

class Service < RestModel
  id type: Integer
  belongs_to :customer, resource_id: proc {resource_id}

  def resource_id
    123456789
  end
end

@service = Service.new(id: 123)

inspect_rest_model(@service)
