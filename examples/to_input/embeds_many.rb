$:.push 'examples'; require 'helper'

class Customer < RestModel
  property :login, field: 'hidden.login'
  embeds_many :phones
end

class Phone < RestModel
  properties :number, :extension
end

@root = Customer.new({
  login: 'jackiechan2010',
  phones: [
    {
      number: "123123123",
      extension: "111"
    },
    {
      number: "098098098",
      extension: "999"
    }
  ]})

inspect_rest_model(@root)
