require 'spec_helper'

describe RestModel::Serialization::Integer do
  it "converts to integer" do
    subject.class.serialize('1200').should == 1200
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("not an integer")}.to raise_error
    end
  end
end
