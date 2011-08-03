require 'spec_helper'

describe Resource::Embeddable do
  it "is a relation" do
    Resource::Embeddable.superclass.should == Resource::Association
  end
end
