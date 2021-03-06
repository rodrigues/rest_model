require 'spec_helper'

describe RestModel::Response do
  before do
    class Example < RestModel
      id         :login
      property   :phone
      embeds_one :address, class_name: :example_child
    end

    class ExampleChild < RestModel
      property   :street
      property   :city
    end

    class SummarizeExample < RestModel
      id
      property :name
      property :login

      summarizes :id, :name, :login
    end
  end

  let(:input) do
    {
      login: 'jackiechan2010',
      phone: '32232188',
      address: {
        street: 'Aurora St.',
        city:   'Recife'
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
      context "with sumarize options" do
        it "returns some resources in an entries array" do
          model = 3.times.map {Example.parse(input).first}
          result = {entries: 3.times.map {input}}
          Example.normalize(model).with_indifferent_access.should == result.with_indifferent_access
        end
      end

      context "without sumarize options" do
        let(:input) do
          {
            id:    "Escape This",
            name:  "My name is",
            login: "my_login"
          }
        end

        let(:expected) do
          {
            entries: [
              {
                id:    "Escape This",
                name:  "My name is",
                login: "my_login",
                href: "http://example.com/summarize_examples/Escape%20This"
              }
            ]
          }
        end

        it "returns some resources in an entries array" do
          model = SummarizeExample.parse(input)
          SummarizeExample.normalize(model).with_indifferent_access.should == expected.with_indifferent_access
        end
      end
    end
  end
end
