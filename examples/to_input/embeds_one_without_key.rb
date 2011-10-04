$:.push 'examples'; require 'helper'

class Customer < RestModel
  properties :login, :name
  embeds_one :address
end

class Address < RestModel
  properties :street, :number, :hint
end

@root = Customer.new({
  login: 'jackiechan2010',
  name: "Jackie Chan",
  address: {
    street: "Aurora St",
    number: 1833,
    hint: "near gas station"
  }
})

inspect_rest_model(@root)
puts "root.to_input without hint: #{@root.to_input(address: {without: :hint})}"
