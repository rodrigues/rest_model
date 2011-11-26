require 'spec_helper'

describe "has_many" do
  describe_example "has_one/simple" do
    it 'parses properly' do
      @root.id.should == 123
      @root.login.should == 'jackiechan2010'
    end

    describe "#resource" do
      subject {@root.resource}

      it 'has a link' do
        subject[:link].should be_an(Array)
      end

      it "has a billing relation" do
        subject[:link].any? {|l| l[:rel] == :billing}.should be_true
      end

      it "has a href for billing relation" do
        link = subject[:link].find {|l| l[:rel] == :billing}
        link[:href].should =~ %r{/customers/123/billing}
      end
    end
  end

  describe_example "has_one/href_options" do
    it 'parses properly' do
      @root.id.should == 123
      @root.login.should == 'jackiechan2010'
    end

    describe "#resource" do
      subject {@root.resource}

      it 'has a link' do
        subject[:link].should be_an(Array)
      end

      it "has a billing relation" do
        subject[:link].any? {|l| l[:rel] == :billing}.should be_true
      end

      it "has a href for billing relation" do
        link = subject[:link].find {|l| l[:rel] == :billing}
        link[:href].should =~ %r{http://external.service.com/customers/123/billing}
      end
    end
  end
end
