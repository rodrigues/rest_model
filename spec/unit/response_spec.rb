require 'spec_helper'

describe Transcriber::Resource::Response do
  before do
    class Example < Resource
      id         :login
      property   :phone
      embeds_one :address, class_name: :example_child
    end

    class ExampleChild < Resource
      property   :street
      property   :city
    end
  end

  let(:input) do
    {
      'login' => 'jackiechan2010',
      'phone' => '32232188',
      'address' => {
        'street' => 'Aurora St.',
        'city'   => 'Recife'
      }
    }
  end

  describe "#normalize" do
    context "when one resource is received" do
      it "returns a resource" do
        model = Example.parse(input).first
        Example.normalize(model).with_indifferent_access.should == input.with_indifferent_access
      end
    end

    context "when a list of resources is received" do
      it "returns some resources in an entries array" do
        model = 3.times.map {Example.parse(input).first}
        result = {entries: 3.times.map {input}}
        Example.normalize(model).with_indifferent_access.should == result.with_indifferent_access
      end
    end
  end
end