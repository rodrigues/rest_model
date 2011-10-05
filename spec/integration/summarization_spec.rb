require 'spec_helper'

describe "summarization" do
  describe_example 'summarization/simple' do
    subject {@root[:entries].first}

    it 'summarizes resources' do
      subject.keys.count.should == 3
      subject[:id].should    == '138911938'
      subject[:login].should == 'jackiechan2010'
      subject[:href].should  == 'http://example.com/customers/138911938'
    end
  end
end
