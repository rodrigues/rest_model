$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :name
  embeds_one :address
end

class Address < RestModel
  properties :street, :number
end

@root = Customer.new({
  name: "Jackie Chan",
  address: {
    street: "Aurora St",
    number: 666
  }})

inspect_rest_model(@root)
