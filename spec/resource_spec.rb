require 'spec_helper'
require 'resource/converter_spec'

describe Resource do
  describe '#resource' do
    before do
      class Example < Resource
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

  context "when using not allowed names as keys" do
    it "raises error for 'resource_id'" do
      expect {
        class Example < Resource
          property 'resource_id'
        end
      }.to raise_error
    end

    it "raises error for :resource_id" do
      expect {
        class Example < Resource
          property :resource_id
        end
      }.to raise_error
    end

    it "raises error for 'resource'" do
      expect {
        class Example < Resource
          property 'resource'
        end
      }.to raise_error
    end

    it "raises error for :resource" do
      expect {
        class Example < Resource
          property :resource
        end
      }.to raise_error
    end

    it "raises error for 'links'" do
      expect {
        class Example < Resource
          property 'links'
        end
      }.to raise_error
    end

    it "raises error for :links" do
      expect {
        class Example < Resource
          property :links
        end
      }.to raise_error
    end
  end
end
