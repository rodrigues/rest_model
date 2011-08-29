require 'spec_helper'

describe Resource::Parser::Embeddable do
  context "when it embeds one" do
    before do
      class ExampleChild < Resource
        property :id
      end
    end

    let(:value) {{id: "7000"}}

    subject {Resource::Embeddable.new(:example_child, many: false)}

    it "parses child" do
      child = subject.parse(value)
      child.id.should == "7000"
    end
  end

  context "when it embeds many" do
    before do
      class ExampleChild < Resource
        property :id
      end
    end

    let(:value) {[{id: "7000"}, {id: "7001"}]}

    subject {Resource::Embeddable.new(:example_children, many: true)}

    it "parses children" do
      children = subject.parse(value)
      children[0].id.should == "7000"
      children[1].id.should == "7001"
    end
  end
end
