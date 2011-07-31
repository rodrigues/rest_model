require 'spec_helper'

describe Transcriber::Resource::Properties do

  class Receipt < Transcriber::Resource
    property :document_number, some_option: 'abab'
  end

  describe ".property" do
    it "defines an attr_accessor with property name" do
      Receipt.new.tap do |r|
        r.document_number = 2020
        r.document_number.should == 2020
      end
    end

    it "puts a new property in keys list" do
      Receipt.keys.first.name.should == :document_number
      Receipt.keys.first.options.should == {some_option: 'abab'}
    end
  end
end