require 'spec_helper'

describe RestModel::Serialization::DateTime do
  it "converts to date time" do
    subject.class.serialize('2011-07-01T10:20:30').should == DateTime.new(2011, 07, 01, 10, 20, 30)
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("not a date time")}.to raise_error
    end
  end
end
