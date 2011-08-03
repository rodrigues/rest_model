require 'spec_helper'

describe Resource::Serialization::Boolean do

  [true,  "true",  "TRUE",  "1", 1, 1.0, "x", "X", "t", "T"].each do |true_value|
    context "when value is #{true_value}" do
      it "returns true" do
        subject.class.serialize(true_value).should be_true
      end
    end
  end

  [false, "false", "FALSE", "0", 0, 0.0,  "", " ", "f", "F", nil].each do |false_value|
    context "when value is #{false_value}" do
      it "returns false" do
        subject.class.serialize(false_value).should be_false
      end
    end
  end

  context "when an invalid value is serialized" do
    it "raises an error" do
      expect {subject.class.serialize("neither true or false")}.to raise_error
    end
  end

end