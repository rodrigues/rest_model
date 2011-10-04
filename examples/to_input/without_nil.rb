$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
  property :name
end

@root = Customer.new(login: 'jackiechan2010')
inspect_rest_model(@root)
puts "root.to_input without nil: #{@root.to_input(without_nil: true)}"

