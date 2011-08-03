require 'spec_helper'

describe Resource::Response do
  shared_examples_for "a relation" do
    context "#to_relation" do
      it "returns a pair with property name and value" do
        subject.to_relation(example).should == result
      end
    end

    context "#to_resource" do
      context "when the key shouldn't be present on resource" do
        it "returns an empty hash" do
          subject.should_receive(:present?).and_return false
          subject.to_resource(example).should == {}
        end
      end

      context "when the relation instance variable in parent returns nil" do
        it "returns an empty hash" do
          subject.to_resource(example).should == {}
        end
      end

      context "otherwise" do

      end
    end
  end

  context "when has one" do
    before do
      class ExampleChild < Resource
        id
        belongs_to :example
      end

      class Example < Resource
        id
        has_one  :example_child
      end
    end

    subject {Example.keys[1]}

    let(:example) {Example.new(id: 100)}
    let(:result)  {{rel: :example_child, href: "/examples/100/example_child"}}

    it_behaves_like "a relation"
  end

  context "when has many" do
    before do
      class ExampleChild < Resource
        property   :id
        belongs_to :example
      end

      class Example < Resource
        property :id
        has_many :example_children
      end
    end

    subject {Example.keys[1]}

    let(:example) {Example.new(id: 200)}
    let(:result)  {{rel: :example_children, href: "/examples/200/example_children"}}

    it_behaves_like "a relation"
  end

  context "when belongs to one" do
    before do
      class ExampleChild < Resource
        property   :id
        belongs_to :example
      end

      class Example < Resource
        property :id
        has_many :example_children
      end
    end

    subject {ExampleChild.keys[1]}

    let(:example) {ExampleChild.new(id: 200)}
    let(:result)  {{rel: :example, href: "/examples/200/example_children"}}

    it_behaves_like "a relation"
  end

  context "when using forbidden key names" do
    [:resource_id, :resource].each do |forbidden_name|
      it "raises an exception for #{forbidden_name}" do
        expect {
          class Example < Resource
            property forbidden_name
          end
        }.to raise_error
      end
    end
  end
end
