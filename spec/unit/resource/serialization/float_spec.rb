require 'spec_helper'

describe Resource::Serialization::Float do
  it "converts to float" do
    subject.class.serialize('1200.49').should == 1200.49
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("not a float")}.to raise_error
    end
  end
end
