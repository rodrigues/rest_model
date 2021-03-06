require 'spec_helper'

describe RestModel::Response do
  shared_examples_for "a relation" do
    context "#to_relation" do
      it "returns a pair with property name and value" do
        subject.to_relation(example).should == result
      end
    end

    context "#to_resource" do
      context "when the key shouldn't be visible on resource" do
        it "returns an empty hash" do
          subject.should_receive(:visible?) {false}
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
      class ExampleChild < RestModel
        id
        belongs_to :example
      end

      class Example < RestModel
        id
        has_one  :example_child
      end
    end

    subject {Example.keys[1]}

    let(:example) {Example.new(id: 100)}
    let(:result)  {{rel: :example_child, href: "http://example.com/examples/100/example_child"}}

    it_behaves_like "a relation"
  end

  context "when has one (with :href option)" do
    before do
      class ExampleChild < RestModel
        id
        belongs_to :example
      end

      class Example < RestModel
        id
        has_one  :example_child, href: proc {example_child_link}

        def example_child_link
          "http://example.com/examples/#{id}/example_custom_child"
        end
      end
    end

    subject {Example.keys[1]}

    let(:example) {Example.new(id: 100)}
    let(:result)  {{rel: :example_child, href: "http://example.com/examples/100/example_custom_child"}}

    it_behaves_like "a relation"
  end

  context "when has many" do
    before do
      class ExampleChild < RestModel
        id
        belongs_to :example
      end

      class Example < RestModel
        id
        has_many :example_children
      end
    end

    subject {Example.keys[1]}

    let(:example) {Example.new(id: 200)}
    let(:result)  {{rel: :example_children, href: "http://example.com/examples/200/example_children"}}

    it_behaves_like "a relation"
  end

  context "when has many (with :href option)" do
    before do
      class ExampleChild < RestModel
        id
        belongs_to :example
      end

      class Example < RestModel
        id
        has_many :example_children, href: proc {example_child_link}

        def example_child_link
          "http://example.com/api/examples/#{id}/example_custom_children"
        end
      end
    end

    subject {Example.keys[1]}

    let(:example) {Example.new(id: 200)}
    let(:result)  {{rel: :example_children, href: "http://example.com/api/examples/200/example_custom_children"}}

    it_behaves_like "a relation"
  end

  context "when belongs to one" do
    before do
      class ExampleChild < RestModel
        id
        belongs_to :example
      end

      class Example < RestModel
        id
        has_many :example_children
      end
    end

    subject {ExampleChild.keys[1]}

    let(:example) {ExampleChild.new(id: 200, example_id: 123)}
    let(:result)  {{rel: :example, href: "http://example.com/examples/123"}}

    it_behaves_like "a relation"
  end

  context "when belongs to one (with :href option)" do
    before do
      class ExampleChild < RestModel
        id
        belongs_to :example, href: proc {example_link}

        def example_link
          "http://example.com/api/examples/#{example_id}"
        end
      end

      class Example < RestModel
        id
        has_many :example_children
      end
    end

    subject {ExampleChild.keys[1]}

    let(:example) {ExampleChild.new(id: 200, example_id: 123)}
    let(:result)  {{rel: :example, href: "http://example.com/api/examples/123"}}

    it_behaves_like "a relation"
  end

  context "escaped href" do
    before do
      class ExampleChild < RestModel
        id
        belongs_to :example
      end

      class Example < RestModel
        id
        has_many :example_children
      end
    end

    subject {ExampleChild.keys[1]}

    let(:example) {ExampleChild.new(id: 200, example_id: "Some Id")}
    let(:result)  {{rel: :example, href: "http://example.com/examples/Some%20Id"}}

    it_behaves_like "a relation"
  end

  context "when using forbidden key names" do
    [:resource_id, :resource].each do |forbidden_name|
      it "raises an exception for #{forbidden_name}" do
        expect {
          class Example < RestModel
            property forbidden_name
          end
        }.to raise_error
      end
    end
  end
end
