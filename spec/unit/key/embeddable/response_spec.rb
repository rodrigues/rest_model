require 'spec_helper'

describe RestModel::Embeddable::Response do
  before do
    class ExampleChild < RestModel
      property :id
    end

    class Example < RestModel
      embeds_one  :example_child
      embeds_many :example_children
    end
  end

  shared_examples_for "an embeddable" do
    it "returns a pair with property name and value" do
      subject.to_resource(example).should == result
    end

    context "when this key shouldn't be visible on resource" do
      it "returns an empty hash" do
        subject.should_receive(:visible?) {false}
        subject.to_resource(example).should == {}
      end
    end
  end

  context "when embeds one" do
    subject {Example.keys[0]}

    let :example do
      Example.new.tap do |example|
        example.example_child = ExampleChild.new(id: "200")
      end
    end

    let(:result) {{example_child: {id: "200"}}}

    it_behaves_like "an embeddable"
  end

  context "when embeds many" do
    subject {Example.keys[1]}

    let :example do
      Example.new.tap do |example|
        example.example_children = [ExampleChild.new(id: "300")]
      end
    end

    let(:result) {{example_children: [{id: "300"}]}}

    it_behaves_like "an embeddable"
  end
end
