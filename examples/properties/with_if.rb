$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login
  property :password
  property :description, if: proc {password == "abc"}
end

@root_with_description = Customer.from_source!({
  login: 2000,
  password: "abc",
  description: "description"
}).first

inspect_rest_model(@root_with_description)

@root_without_description = Customer.from_source!({
  login: 2000,
  password: "abcd",
  description: "some text II"
}).first

inspect_rest_model(@root_without_description)
