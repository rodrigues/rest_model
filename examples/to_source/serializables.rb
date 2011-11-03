$:.push 'examples'; require 'helper'

RestModel::Configuration.configure do |c|
  c.true_value = "X"
  c.false_value = ""
  c.date_format = "%Y%m%d"
  c.date_time_format = "%a %b %d %H:%M:%S %Y"
end

class Customer < RestModel
  property :login
  property :age,        type: Integer
  property :birth,      type: Date
  property :created_at, type: DateTime
  property :active,     type: Boolean
  property :services,   type: Enumerable
  property :balance,    type: Float
end

@root = Customer.new(login: 'jackiechan2010',
                     age: 22,
                     birth: "1990-07-04",
                     created_at: DateTime.now,
                     active: true,
                     services: ["Hosting", "Email"],
                     balance: 200.00)

inspect_rest_model(@root)
