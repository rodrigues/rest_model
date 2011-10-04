require 'spec_helper'

describe RestModel::Embeddable::Retriever do
  context "when it embeds one" do
    before do
      class ExampleChild < RestModel
        property :id
      end
    end

    let(:value) {{id: "7000"}}

    subject {RestModel::Embeddable.new(:example_child, many: false, start_key: "")}

    it "parses child" do
      child = subject.from_source(value)
      child.id.should == "7000"
    end
  end

  context "when it embeds many" do
    before do
      class ExampleChild < RestModel
        property :id
      end
    end

    let(:value) {{example_children: [{id: "7000"}, {id: "7001"}]}}

    subject {RestModel::Embeddable.new(:example_children, many: true)}

    it "parses children" do
      children = subject.from_source(value)
      children[0].id.should == "7000"
      children[1].id.should == "7001"
    end
  end
end
