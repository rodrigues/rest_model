require 'spec_helper'

describe RestModel::Property::Retriever do
  subject {RestModel::Property.new(:login)}

  let(:item)            {{login: "jackiechan2010"}}
  let(:serializer_mock) {double :serializer}

  before do
    allow(subject).to receive(:serializer) {serializer_mock}
  end

  it "tries to serialize value" do
    serializer_mock.should_receive(:serialize).with(item[:login], instance_of(Hash)) {item[:login]}
    subject.from_source(item)
  end

  context "when there is a values map" do
    let(:values) {{paid: '01', unpaid: '02'}}

    subject do
      options = {values: values}
      RestModel::Property.new(:payment_status, options)
    end

    it "maps value" do
      subject.from_source({payment_status: "02"}).should == :unpaid
    end
  end
end
