require 'spec_helper'

describe RestModel::Client do
  describe ".host" do
    before do
      class Example < RestModel
        host :one
      end

      class AnotherExample < RestModel
        host :two
      end

      class ExampleChild < RestModel
      end
    end

    it "returns set class host when defined" do
      Example.host.should == :one
      AnotherExample.host.should == :two
    end

    it "returns default host when not defined" do
      ExampleChild.host.should == :default
    end
  end

  describe ".get" do
    before do
      RestModel::Configuration.configure do |c|
        c.hosts = {
         one: "http://one.com"
        }
      end

      class Example < RestModel
        host :one
        id
        property :name
      end
    end

    context "when calling with no parameters" do
      let :examples do
        {
          entries: [
            {
              id:   "28287287",
              name: "Aadvark"
            },
            {
              id:   "19871897",
              name: "Awkward"
            }
          ]
        }
      end

      before do
        RestClient.stub(:get).with("http://one.com/examples", {}).and_return(examples.to_json)
      end

      it "returns a list of resources" do
        Example.get.map(&:resource).should == examples[:entries]
      end
    end

    context "when calling with an identifier parameter" do
      let :example do
        {
          id:   "19871897",
          name: "Awkward"
        }
      end

      before do
        RestClient.stub(:get).with("http://one.com/examples/19871897", {}).and_return(example.to_json)
      end

      it "returns a resource" do
        Example.get("19871897").resource.should == example
      end
    end
  end
end
