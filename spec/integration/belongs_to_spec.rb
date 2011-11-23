require 'spec_helper'

describe "belongs_to" do
  describe_example "belongs_to/simple" do
    it 'parses properly' do
      @service.id.should == 123
      @service.customer_id.should == 999
    end

    describe "#resource" do
      subject {@service.resource}

      it 'has a link' do
        subject[:link].should be_an(Array)
      end

      it "has a customer relation" do
        subject[:link].any? {|l| l[:rel] == :customer}.should be_true
      end

      it "has a href for customer relation" do
        link = subject[:link].find {|l| l[:rel] == :customer}
        link[:href].should =~ %r{/customers/999}
      end
    end
  end

  describe_example "belongs_to/resource_id_options" do
    it 'parses properly' do
      @service.id.should == 123
      @service.customer_id.should be_nil
    end

    describe "#resource" do
      subject {@service.resource}

      it 'has a link' do
        subject[:link].should be_an(Array)
      end

      it "has a customer relation" do
        subject[:link].any? {|l| l[:rel] == :customer}.should be_true
      end

      it "has a href for customer relation" do
        link = subject[:link].find {|l| l[:rel] == :customer}
        link[:href].should =~ %r{/customers/123456789}
      end
    end
  end

  describe_example "belongs_to/resource_id_from_source", wip: true do
    it 'parses properly' do
      @service.id.should == 123
      @service.customer_id.should == 999
    end

    describe "#resource" do
      subject {@service.resource}

      it 'has a link' do
        subject[:link].should be_an(Array)
      end

      it "has a customer relation" do
        subject[:link].any? {|l| l[:rel] == :customer}.should be_true
      end

      it "has a href for customer relation" do
        link = subject[:link].find {|l| l[:rel] == :customer}
        link[:href].should =~ %r{/customers/999}
      end
    end
  end
end
