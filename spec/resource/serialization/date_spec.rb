require 'spec_helper'

describe Transcriber::Resource::Serialization::Date do
  it "converts to date" do
    subject.class.serialize('2011-07-01').should == Date.new(2011, 07, 01)
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("not a date")}.to raise_error
    end
  end
end