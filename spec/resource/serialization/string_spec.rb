require 'spec_helper'

describe Resource::Serialization::String do
  it "converts value to string" do
    subject.class.serialize(:something).should == "something"
  end

  it "returns nil when value is nil" do
    subject.class.serialize(nil).should be_nil
  end
end
