$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login, field: 'hidden.login'
  embeds_many :phones
end

class Phone < Transcriber::Resource
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

puts "root.to_input: #{@root.to_input}"


puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"