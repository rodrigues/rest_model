$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :name
  embeds_many :phones, class_name: :array
end

@root = Customer.new(name: "Jackie Chan", phones: ["1391938", "893271984"])
inspect_rest_model(@root)
