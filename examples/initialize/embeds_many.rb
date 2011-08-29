$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :name
  embeds_many :phones
end

class Phone < Transcriber::Resource
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

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
