$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
  property :name
end

@root = Customer.new(login: 'jackiechan2010')
inspect_rest_model(@root)
puts "root.to_source without nil: #{@root.to_source(without_nil: true)}"

