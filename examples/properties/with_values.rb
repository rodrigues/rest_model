$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :periodicity, values: {1 => "c_53", 2 => "c_z1"}
  property :company,     values: {"amazon" => "AM", "google" => "GOOG"}
  property :type,        values: {simple: "1", complex: "2"}
end

@root = Customer.from_source(periodicity: 'c_53', company: "GOOG", type: 2).first
inspect_rest_model(@root)
