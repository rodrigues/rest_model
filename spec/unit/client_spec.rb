require 'spec_helper'

describe RestModel::Client do
  before do
    class Example < RestModel
      host :one
    end

    class AnotherExample < RestModel
      host :two
    end
  end

  it "sets class host" do
    Example.host.should == :one
    AnotherExample.host.should == :two
  end
end
