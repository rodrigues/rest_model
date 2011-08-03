require 'spec_helper'

describe Resource::Response::Property do
  class Customer
    attr_accessor :login
  end

  subject {Resource::Property.new(:login)}

  it "returns a pair with property name and value" do
    customer = Customer.new.tap {|c| c.login = "jackiechan2010"}
    subject.to_resource(customer).should == {login: "jackiechan2010"}
  end

  context "when this key shouldn't be present on resource" do
    it "returns an empty hash" do
      subject.should_receive(:present?).and_return false
      customer = Customer.new.tap {|c| c.login = "jackiechan2010"}
      subject.to_resource(customer).should == {}
    end
  end
end
