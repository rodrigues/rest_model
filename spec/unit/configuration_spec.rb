require 'spec_helper'

describe RestModel::Configuration do
  after(:all) {subject.convert_input_keys = nil}

  context "when no custom input keys converter is set" do
    it "returns default key converter" do
      default_handler = RestModel::Configuration::DefaultHandler
      subject.convert_input_keys.should == default_handler
    end
  end

  context "when a custom input keys converter is set" do
    let(:custom_convert_input_keys) {lambda {|keys| keys}}

    before {subject.convert_input_keys = custom_convert_input_keys}

    it "returns custom key converter" do
      subject.convert_input_keys.should == custom_convert_input_keys
    end
  end
end
