require 'spec_helper'

describe RestModel::Property::Response do
  class Customer
    attr_accessor :login
  end

  subject {RestModel::Property.new(:login)}

  it "returns a pair with property name and value" do
    customer = Customer.new.tap {|c| c.login = "jackiechan2010"}
    subject.to_resource(customer).should == {login: "jackiechan2010"}
  end

  context "when this key shouldn't be visible on resource" do
    it "returns an empty hash" do
      subject.should_receive(:visible?).and_return false
      customer = Customer.new.tap {|c| c.login = "jackiechan2010"}
      subject.to_resource(customer).should == {}
    end
  end
end
