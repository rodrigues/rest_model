$:.push 'examples'; require 'helper'

class Customer < RestModel
  properties :login, :name
  embeds_many :phones
end

class Phone < RestModel
  properties :number, :extension, :description
end

@root = Customer.new(login: 'jackiechan2010',
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
                     ])

inspect_rest_model(@root)

puts "to input without description: #{@root.to_source(phones: {without: :description})}"
