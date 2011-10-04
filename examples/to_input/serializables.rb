$:.push 'lib'; require 'transcriber'

Transcriber.configure do |c|
  c.true_value = "X"
  c.false_value = ""
  c.date_format = "%Y%m%d"
end

class Customer < Transcriber::Resource
  property :login
  property :age,      type: Integer
  property :birth,    type: Date
  property :active,   type: Boolean
  property :services, type: Enumerable
  property :balance,  type: Float
end

@root = Customer.new({login: 'jackiechan2010', age: 22, birth: "1990-07-04", active: true, services: ["Hosting", "Email"], balance: 200.00})

puts "root.to_input: #{@root.to_input}"

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
