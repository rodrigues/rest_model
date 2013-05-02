require 'spec_helper'

describe RestModel::Serialization::Integer do
  it "adds leading zeros from options while desserializing" do
    subject.class.desserialize('1200', padding_zeros: 12).should == "000000001200"
  end

  it "converts to integer" do
    subject.class.serialize('1200').should == 1200
  end

  it "converts negative number to negative integer" do
    subject.class.serialize('-1').should == -1
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("not an integer")}.to raise_error
    end
  end
end
