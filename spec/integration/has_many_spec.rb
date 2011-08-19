require 'spec_helper'

describe_example "has_many/simple" do
  it 'parses customer properly' do
    root.id.should == 123
    root.login.should == 'jackiechan2010'
  end

  describe "#resource" do
    subject {root.resource}

    it 'has a link' do
      subject[:link].should be_an(Array)
    end

    it 'has a relation to a service' do
      subject[:link].first[:rel].should == :services
    end
  end
end
