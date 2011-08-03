require 'spec_helper'

describe Resource::Property do
  describe "#initialize" do
    context "serializer" do
      context "when custom is provided" do
        subject do
          options = {type: Resource::Serialization::Boolean}
          Resource::Property.new(:haz_bool?, options)
        end

        it "configures custom" do
          subject.serializer.should == Resource::Serialization::Boolean
        end
      end

      context "when it isn't provided" do
        subject {Resource::Property.new(:login)}

        it "uses String serializer" do
          subject.serializer.should == Resource::Serialization::String
        end
      end
    end

    context "when values map is provided" do
      let(:values) {{paid: '01', unpaid: '02'}}

      subject do
        options = {values: values}
        Resource::Property.new(:payment_status, options)
      end

      it "configures values" do
        subject.translations.should == values.invert
      end
    end
  end
end
