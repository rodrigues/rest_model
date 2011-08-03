require 'spec_helper'

describe Transcriber::Resource::Response do
  class Responder
    include Resource::Response
  end

  subject {Responder.new}

  before do
    class Example < Resource
      id         :login
      property   :phone
      embeds_one :address, class_name: :example_child
    end

    class ExampleChild < Resource
      property   :street
      property   :city
    end
  end

  let(:input) do
    {
      'login' => 'jackiechan2010',
      'phone' => '32232188',
      'address' => {
        'street' => 'Aurora St.',
        'city'   => 'Recife'
      }
    }
  end

  describe "#respond_with" do
    context "when one resource is received" do
      it "returns a resource" do
        model = Example.parse(input).first
        subject.respond_with(model).should == [200, {"Content-Type" => "application/json"}, input.to_json]
      end
    end

    context "when a list of resources is received" do
      it "returns some resources in an entries array" do
        model = 3.times.map {Example.parse(input).first}
        result = {entries: 3.times.map {input}}.to_json
        subject.respond_with(model).should == [200, {"Content-Type" => "application/json"}, result]
      end
    end
  end
end