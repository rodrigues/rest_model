require 'spec_helper'

describe RestModel::Serialization::Date do
  it "converts to date" do
    subject.class.serialize('2011-07-01').should == Date.new(2011, 07, 01)
  end

  it "desserializes to date respecting the provided format" do
    subject.class.desserialize(Date.new(2038, 1, 19), format: "%a %b %d %Y").should == "Tue Jan 19 2038"
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("not a date")}.to raise_error
    end
  end
end
