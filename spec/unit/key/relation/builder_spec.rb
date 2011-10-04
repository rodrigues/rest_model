require 'spec_helper'

describe RestModel::Relation::Builder do
  describe ".has_one" do
    before do
      class Example < RestModel
        has_one :item, some_option: 'option'
      end
    end

    let(:field)   {:item}
    let(:many)    {false}
    let(:options) {{some_option: 'option', many: many, has: true}}

    it_behaves_like "an association"

    it "puts a new relation in relation list" do
      Example.relations.find {|relation| relation.name == field}.name.should == field
    end
  end

  describe ".has_many" do
    before do
      class Example < RestModel
        has_many :items, some_option: 'option'
      end
    end

    let(:field)   {:items}
    let(:many)    {true}
    let(:options) {{some_option: 'option', many: many, has: true}}

    it_behaves_like "an association"

    it "puts a new relation in relation list" do
      Example.relations.find {|relation| relation.name == field}.name.should == field
    end
  end

  describe ".belongs_to" do
    before do
      class Example < RestModel
        belongs_to :item, some_option: 'option'
      end
    end

    let(:field)   {:item}
    let(:many)    {false}
    let(:options) {{some_option: 'option', many: many, has: false}}

    it_behaves_like "an association"
  end
end
