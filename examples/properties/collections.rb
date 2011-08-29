$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login
end

@customers = Customer.parse([{login: "jackiechan2010"},
                             {login: "brucelee"},
                             {login: "vcr2"}])

puts "root:     #{@customers.inspect}"
puts "resource: #{Customer.resources @customers}"
