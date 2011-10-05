$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login, field: 'hidden.login'
  embeds_one :address
end

class Address < RestModel
  properties :street, :number
end

@root = Customer.new(login: 'jackiechan2010', address: {street: "Aurora St", number: 666})
inspect_rest_model(@root)