require 'spec_helper'

describe Transcriber::Resource::Property::Parser do

  subject {Transcriber::Resource::Property.new(:login)}

  let(:value)           {"jackiechan2010"}
  let(:serializer_mock) {mock :serializer}

  before do
    subject.stub!(:serializer).and_return serializer_mock
  end

  it "tries to serialize value" do
    serializer_mock.should_receive(:serialize).with(value).and_return(value)
    subject.parse(value)
  end

  context "when there is a values map" do
    let(:values) {{paid: '01', unpaid: '02'}}

    subject do
      options = {values: values}
      Transcriber::Resource::Property.new(:payment_status, options)
    end

    it "maps value" do
      serializer_mock.should_receive(:serialize).with(value).and_return "02"
      subject.parse(value).should == :unpaid
    end
  end

end