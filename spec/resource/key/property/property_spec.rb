require 'spec_helper'

describe Transcriber::Resource::Property do
  describe "#initialize" do
    context "serializer" do
      context "when custom is provided" do
        subject do
          options = {type: Transcriber::Resource::Serialization::Boolean}
          Transcriber::Resource::Property.new(:haz_bool?, options)
        end

        it "configures custom" do
          subject.serializer.should == Transcriber::Resource::Serialization::Boolean
        end
      end

      context "when it isn't provided" do
        subject {Transcriber::Resource::Property.new(:login)}

        it "uses String serializer" do
          subject.serializer.should == Transcriber::Resource::Serialization::String
        end
      end
    end

    context "when values map is provided" do
      let(:values) {{paid: '01', unpaid: '02'}}

      subject do
        options = {values: values}
        Transcriber::Resource::Property.new(:payment_status, options)
      end

      it "configures values" do
        subject.values.should == values
      end
    end
  end
end