$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login, field: 'hidden.login'
end

@root = Customer.from_source!("hidden" => {"login" => 'jackiechan2010'}).first
inspect_rest_model(@root)
