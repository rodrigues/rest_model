require 'spec_helper'

describe_example 'properties/simple' do
  it 'parses property' do
    root.login.should == 'jackiechan2010'
  end
end