$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :name
  embeds_many :phones
end

class Phone < RestModel
  properties :number, :extension
end

@root = Customer.new({
  name: "Jackie Chan",
  phones: [
    {
      number: "2980319083",
      extension: "1398"
    },
    {
      number: "2979139332",
      extension: "1011"
    }
  ]})

inspect_rest_model(@root)
