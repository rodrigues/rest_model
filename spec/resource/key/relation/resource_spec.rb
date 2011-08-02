require 'spec_helper'

describe Transcriber::Resource::Relation::Resource do
  shared_examples_for "a relation" do
    it "returns a pair with property name and value" do
      Example.keys[1].to_relation(example).should == result
    end

    context "when this key shouldn't be present on resource" do
      it "returns an empty hash" do
        #Example.keys[1].should_receive(:present?).and_return false
        Example.keys[1].to_resource(example).should == {}
      end
    end
  end

  context "when has one" do
    before do
      class ExampleChild < Transcriber::Resource
        id
        belongs_to :example
      end

      class Example < Transcriber::Resource
        id
        has_one  :example_child
      end
    end

    let(:example) {Example.new(id: 100)}
    let(:result)  {{rel: :example_child, href: "/examples/100/example_child"}}

    it_behaves_like "a relation"
  end

  context "when has many" do
    before do
      class ExampleChild < Transcriber::Resource
        property   :id
        belongs_to :example
      end

      class Example < Transcriber::Resource
        property :id
        has_many :example_children
      end
    end

    let(:example) {Example.new(id: 200)}
    let(:result)  {{rel: :example_children, href: "/examples/200/example_children"}}

    it_behaves_like "a relation"
  end
  context "when using forbidden key names" do
    [:resource_id, :resource].each do |forbidden_name|
      it "raises an exception for #{forbidden_name}" do
        expect {
          class Example < Transcriber::Resource
            property forbidden_name
          end
        }.to raise_error
      end
    end
  end
end
