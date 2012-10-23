require 'spec_helper'

describe RestModel::Property::Response do
  class User
    attr_accessor :login
  end

  subject {RestModel::Property.new(:login)}

  it "returns a pair with property name and value" do
    user = User.new.tap {|u| u.login = "jackiechan2010"}
    subject.to_resource(user).should == {login: "jackiechan2010"}
  end

  context "when this key shouldn't be visible on resource" do
    it "returns an empty hash" do
      subject.should_receive(:visible?) {false}
      user = User.new.tap {|u| u.login = "jackiechan2010"}
      subject.to_resource(user).should == {}
    end
  end
end
