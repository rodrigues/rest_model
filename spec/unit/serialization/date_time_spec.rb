require 'spec_helper'

describe RestModel::Serialization::DateTime do
  it "converts to date time" do
    subject.class.serialize('2011-07-01T10:20:30').should == DateTime.new(2011, 07, 01, 10, 20, 30)
  end

  it "desserializes to date time respecting the provided format" do
    subject.class.desserialize(DateTime.new(2012, 12, 31, 12, 0, 0), format: "%a %b %d %H:%M:%S %Y").should == "Mon Dec 31 12:00:00 2012"
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("not a date time")}.to raise_error
    end
  end
end
