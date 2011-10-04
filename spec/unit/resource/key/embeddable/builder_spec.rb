require 'spec_helper'

describe Resource::Embeddable::Builder do
  before do
    class Example < Transcriber::Resource
      embeds_one  :contract,      some_option: 'contract options'
      embeds_many :invoice_items, some_option: 'invoice options'
    end
  end

  describe ".embeds_one" do
    let(:field)   {:contract}
    let(:many)    {false}
    let(:options) {{some_option: 'contract options', many: many}}

    it_behaves_like "an association"
  end

  describe ".embeds_many" do
    let(:field)   {:invoice_items}
    let(:many)    {true}
    let(:options) {{some_option: 'invoice options', many: many}}

    it_behaves_like "an association"
  end
end
