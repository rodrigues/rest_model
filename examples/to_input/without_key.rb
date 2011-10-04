$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
  property :name
end

@root = Customer.new(login: 'jackiechan2010', name: "Jackie Chan")

puts "root.to_input: #{@root.to_input(without: :name)}"
inspect_rest_model(@root)
