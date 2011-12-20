$:.push 'examples'; require 'helper'

class Root < RestModel
  id type: Integer
  property :name
  property :sudo, values: {true => "please"}
  embeds_one :entry
end

class Entry < RestModel
  property :name
  property :some_date, type: Date
  embeds_many :services
end

class Service < RestModel
  property :code, type: Integer
  embeds_many :products
end

class Product < RestModel
  VALUES = [10.00, 20.00, 25.50]
  property :value, type: Float, values: VALUES
  property :created_at, type: DateTime
end


products = [
  {
    value: 100.00,
    created_at: "non datetime (P0)"
  },
  {
    value: "non float (P1)",
    created_at: "2011-11-11T11:11:11"
  },
  {
    value: 20.00,
    created_at: "2011-11-11T11:11:11"
  }
]

services = [
  {
    code: "non integer (S0)",
    products: products
  }
]

entry = {
  name: "Some name",
  some_date: "some invalid date",
  services: services
}

root = {
  id: 1,
  name: "Please",
  sudo: true,
  entry: entry
}

@root = Root.new(root)

inspect_rest_model(@root)
