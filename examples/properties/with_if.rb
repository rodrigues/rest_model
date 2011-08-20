$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login
  property :password
  property :description, if: proc {password == "abc"}
end

@root_with_description = Customer.parse({
  "login" => 2000,
  "password" => "abc",
  "description" => "description"}).first


puts "root:     #{@root_with_description.inspect}"
puts "resource: #{@root_with_description.resource}"


@root_without_description = Customer.parse({
  "login" => 2000,
  "password" => "abcd",
  "description" => "some text II"}).first

puts "root:     #{@root_without_description.inspect}"
puts "resource: #{@root_without_description.resource}"
