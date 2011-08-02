require 'spec_helper'
require 'resource/builder/shared_example_for_relations'

describe Transcriber::Resource::Builder::Associations do
  describe ".has_one" do
    before do
      class Example < Transcriber::Resource
        has_one :item, some_option: 'option'
      end
    end

    let(:field)   {:item}
    let(:many)    {false}
    let(:options) {{some_option: 'option', many: many, has: true}}

    it_behaves_like "a relation"
  end

  describe ".has_many" do
    before do
      class Example < Transcriber::Resource
        has_many :items, some_option: 'option'
      end
    end

    let(:field)   {:items}
    let(:many)    {true}
    let(:options) {{some_option: 'option', many: many, has: true}}

    it_behaves_like "a relation"
  end

  describe ".belongs_to" do
    before do
      class Example < Transcriber::Resource
        belongs_to :item, some_option: 'option'
      end
    end

    let(:field)   {:item}
    let(:many)    {false}
    let(:options) {{some_option: 'option', many: many, has: false}}

    it_behaves_like "a relation"
  end
end