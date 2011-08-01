$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login
  property :password
  property :some_text, when: proc { password == "abc"}
end

root = Customer.parse({"login" => 2000, "password" => "abc", "some_text" => "some text"}).first


puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"


root = Customer.parse({"login" => 2000, "password" => "abcd", "some_text" => "some text II"}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
