$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  properties :login, :name
  embeds_many :phones
end

class Phone < Transcriber::Resource
  properties :number, :extension, :description
end

@root = Customer.new({
  login: 'jackiechan2010',
  name: "Jackie Chan",
  phones: [
   {
     number: "897289472",
     extension: "3897",
     description: "abab"
   },
   {
     number: "987198732",
     extension: "1897",
     description: "eheh"
   }
  ]
})

puts "root.to_input: #{@root.to_input(phones: {without: :description})}"
puts "root:     #{@root.inspect}"
