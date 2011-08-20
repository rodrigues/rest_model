require 'spec_helper'

describe_example 'summarization/simple' do
  subject {Customer.resources(entries)[:entries].first}

  it 'summarizes resources' do
    subject.keys.count.should == 2
    subject.should have_key(:id)
    subject.should have_key(:login)
  end
end
