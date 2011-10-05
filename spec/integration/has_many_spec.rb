require 'spec_helper'

describe "has_many" do
  describe_example "has_many/simple" do
    it 'parses properly' do
      @root.id.should == 123
      @root.login.should == 'jackiechan2010'
    end

    describe "#resource" do
      subject {@root.resource}

      it 'has a link' do
        subject[:link].should be_an(Array)
      end

      [:services, :billing, :devops].each do |rel|
        it "has a #{rel} relation" do
          subject[:link].any? {|l| l[:rel] == rel}.should be_true
        end

        it "has a href for #{rel} relation" do
          link = subject[:link].find {|l| l[:rel] == rel}
          link[:href].should =~ %r{/customers/123/#{rel}}
        end
      end
    end
  end
end
