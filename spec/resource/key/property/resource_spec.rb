require 'spec_helper'

describe Transcriber::Resource::Property::Resource do

  class Customer
    attr_accessor :login
  end

  subject {Transcriber::Resource::Property.new(:login)}

  it "returns a pair with property name and value" do
    customer = Customer.new.tap {|c| c.login = "jackiechan2010"}
    subject.to_resource(customer).should == {login: "jackiechan2010"}
  end

end