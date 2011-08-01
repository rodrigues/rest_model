require 'spec_helper'

describe Transcriber::Resource::Embeddable::Resource do
  class Developer < Transcriber::Resource
    property :language
  end

  class Service < Transcriber::Resource
    property :id
  end

  class Customer < Transcriber::Resource
    embeds_one :developer
    embeds_many :services
  end

  shared_examples_for "embeddable" do
    it "returns a pair with property name and value" do
      subject.to_resource(customer).should == result
    end

    context "when this key shouldn't be present on resource" do
      it "returns an empty hash" do
        subject.should_receive(:present?).and_return false
        subject.to_resource(customer).should == {}
      end
    end
  end

  context "when embeds one" do
    subject {Transcriber::Resource::Embeddable.new(:developer, many: false)}

    let :customer do
      Customer.new.tap do |c|
        developer = Developer.new
        developer.language = "smalltalk"
        c.developer = developer
      end
    end

    let(:result) {{developer: {language: "smalltalk"}}}

    it_behaves_like "embeddable"
  end

  context "when embeds many" do
    subject {Transcriber::Resource::Embeddable.new(:services, many: true)}

    let :customer do
      Customer.new.tap do |c|
        service = Service.new
        service.id = 1000
        c.services = [service]
      end
    end

    let(:result) {{services: [{id: 1000}]}}

    it_behaves_like "embeddable"
  end
end
