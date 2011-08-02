require 'spec_helper'

describe Transcriber::Resource::Builder::Associations do
  shared_examples_for "an association" do
    it "defines an attr_accessor with association name" do
      Example.new.tap do |example|
        example.respond_to?("#{field}").should be_true
        example.respond_to?("#{field}=").should be_true
      end
    end

    it "puts a new association in keys list" do
      Example.keys.find {|key| key.name == field}.name.should == field
    end

    it "supports option definition" do
      Example.keys.find {|key| key.name == field}.options.should == options
    end
  end

  describe ".has_one" do
    before do
      class Example < Transcriber::Resource
        has_one :item, some_option: 'option'
      end
    end

    let(:field)   {:item}
    let(:options) {{some_option: 'option'}}

    it_behaves_like "an association"

    it "really has one" do

    end
  end
end