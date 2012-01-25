require 'spec_helper'

describe RestModel::Configuration do
  describe "#convert_input_keys" do
    after :all do
      RestModel::Configuration.convert_input_keys = nil
    end
  
    context "when no custom input keys converter is set" do
      it "returns default key converter" do
        default_handler = RestModel::Configuration::DefaultHandler
        RestModel::Configuration.convert_input_keys.should == default_handler
      end
    end
  
    context "when a custom input keys converter is set" do
      let(:custom_convert_input_keys) {lambda {|keys| keys}}
  
      before {RestModel::Configuration.convert_input_keys = custom_convert_input_keys}
  
      it "returns custom key converter" do
        RestModel::Configuration.convert_input_keys.should == custom_convert_input_keys
      end
    end
  end
  
  describe "#hosts" do
    after :all do
      RestModel::Configuration.hosts = {}
    end
    
    context "when no custom hosts are set" do
      it "returns an empty hash" do
        RestModel::Configuration.hosts.should == {}
      end
    end
    
    context "when custom hosts are set" do
      let :hosts do
        {
          one: "http://serviceone.com",
          two: "http://servicetwo.com"
        }
      end
      
      before {RestModel::Configuration.hosts = hosts}
        
      it "returns custom set hosts" do
        RestModel::Configuration.hosts.should == hosts
      end
    end
  end
end
