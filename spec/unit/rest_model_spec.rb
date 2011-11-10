require 'spec_helper'

describe RestModel do
  describe '#resource' do
    before do
      class Example < RestModel
        property :login
        property :name
        property :age, type: Float
      end
    end

    it "returns a hash with properties and its values" do
      example = Example.new(login: 'jackiechan2010', name: 'Jackie Chan', age: 45)
      example.resource.should == {login: 'jackiechan2010', name: 'Jackie Chan', age: 45}
    end
  end
end
