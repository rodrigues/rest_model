require 'spec_helper'

describe RestModel::Property do
  describe "#initialize" do
    context "serializer" do
      context "when custom is provided" do
        subject do
          options = {type: RestModel::Serialization::Boolean}
          RestModel::Property.new(:haz_bool?, options)
        end

        it "configures custom" do
          subject.serializer.should == RestModel::Serialization::Boolean
        end
      end

      context "when it isn't provided" do
        subject {RestModel::Property.new(:login)}

        it "uses String serializer" do
          subject.serializer.should == RestModel::Serialization::String
        end
      end
    end

    context "when values map is provided" do
      let(:values) {{paid: '01', unpaid: '02'}}

      subject do
        options = {values: values}
        RestModel::Property.new(:payment_status, options)
      end

      it "configures values" do
        subject.translation.should be_a(RestModel::Source::Translation)
        subject.translation.values.should == values
      end
    end
  end
end
