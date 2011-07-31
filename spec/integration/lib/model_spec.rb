require 'spec_helper'

describe "Something" do
  it "returns a hash with properties and its values for complex tree" do
    class CustomerExample < Transcriber::Resource
      property   :login
      property   :name
      embeds_one :address, class_name: "CustomerAddressExample"
    end

    class CustomerAddressExample< Transcriber::Resource
      property :street
      property :number, type: Float
      property :complement
    end

    result = CustomerExample.parse(
              {"LOGIN" => "jetlee2011", "NAME" => "Jet Lee",
               "STREET" => "Gringolandia", "NUMBER" => "123", "COMPLEMENT" => "apt 321"})

    result.first.resource.should ==
              {login: "jetlee2011", name: "Jet Lee",
               address: {street: "Gringolandia", number: 123.0, complement: "apt 321"}}
  end
end