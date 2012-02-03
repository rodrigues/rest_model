require 'spec_helper'

describe RestModel::Configuration do
  subject {RestModel::Configuration}

  describe "#convert_input_keys" do
    after :all do
      subject.convert_input_keys = nil
    end

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

  describe "#custom_headers_resolver" do
    after :all do
      subject.custom_headers_resolver = nil
    end

    context "when no custom headers resolver is set" do
      it "returns default resolver" do
        subject.custom_headers_resolver.call.should == {}
      end
    end

    context "when a custom headers resolver is set" do
      let(:custom_headers_resolver) {proc {{ola: true}}}

      before {subject.custom_headers_resolver = custom_headers_resolver}

      it "returns custom headers resolver" do
        subject.custom_headers_resolver.call.should == {ola: true}
      end
    end
  end

  describe "#hosts" do
    after(:all) {subject.hosts = {}}

    context "when no custom hosts are set" do
      before do
        if subject.instance_variable_defined?(:@hosts)
          subject.send(:remove_instance_variable, :@hosts)
        end
      end

      it "returns a hash with default host only" do
        subject.hosts.should == {default: RestModel::Configuration.host}
      end
    end

    context "when custom hosts are set" do
      let :hosts do
        {
          one: "http://serviceone.com",
          two: "http://servicetwo.com"
        }
      end

      before {subject.hosts = hosts}

      it "returns custom set hosts" do
        subject.hosts.should == hosts.merge(default: RestModel::Configuration.host)
      end
    end
  end

  describe "#true_value" do
    context "when no custom value is set" do
      before do
        if subject.instance_variable_defined?(:@true)
          subject.send(:remove_instance_variable, :@true)
        end
      end

      it "returns true" do
        subject.true_value.should be_true
      end
    end

    context "when a custom value is set" do
      before {subject.true_value = "VDD"}

      it "returns custom value" do
        subject.true_value.should == "VDD"
      end
    end
  end

  describe "#false_value" do
    context "when no custom value is set" do
      before do
        if subject.instance_variable_defined?(:@false)
          subject.send(:remove_instance_variable, :@false)
        end
      end

      it "returns false" do
        subject.false_value.should be_false
      end
    end

    context "when a custom value is set" do
      before {subject.false_value = "NOT"}

      it "returns custom value" do
        subject.false_value.should == "NOT"
      end
    end
  end

  describe "#date_format" do
    context "when no custom value is set" do
      before do
        if subject.instance_variable_defined?(:@date_format)
          subject.send(:remove_instance_variable, :@date_format)
        end
      end

      it "returns nil" do
        subject.date_format.should_not be
      end
    end

    context "when a custom value is set" do
      before {subject.date_format = "%Y%m%d"}

      it "returns custom value" do
        subject.date_format.should == "%Y%m%d"
      end
    end
  end

  describe "#date_time_format" do
    context "when no custom value is set" do
      before do
        if subject.instance_variable_defined?(:@date_time_format)
          subject.send(:remove_instance_variable, :@date_time_format)
        end
      end

      it "returns nil" do
        subject.date_time_format.should_not be
      end
    end

    context "when a custom value is set" do
      before {subject.date_time_format = "%a %b %d %H:%M:%S %Y"}

      it "returns custom value" do
        subject.date_time_format.should == "%a %b %d %H:%M:%S %Y"
      end
    end
  end
end
