require 'spec_helper'

module InputKeysConverterStrategy
  def self.call(keys)
    keys.map {|key| key.to_s.upcase}
  end
end

describe RestModel::Source::Path do
  shared_examples_for "an input path" do
    it "brings the correct input path" do
      subject.source_path.should == path
    end
  end

  context "when a custom path is not defined" do
    context "and there is'nt a custom keys input converter" do
      subject    {RestModel::Key.new(:name)}
      let(:path) {[:name]}
      it_behaves_like "an input path"
    end

    context "and there is a custom keys input converter" do
      subject {RestModel::Key.new(:name, convert_input_keys: InputKeysConverterStrategy)}
      let(:path) {['NAME']}
      it_behaves_like "an input path"
    end
  end

  context "when a custom path is defined" do
    context "and it is a simple name" do
      subject    {RestModel::Key.new(:name, field: :other_name)}
      let(:path) {[:other_name]}
      it_behaves_like "an input path"
    end

    context "and it is a set of names composed by dot" do
      subject    {RestModel::Key.new(:name, field: 'a.long.way.to.go')}
      let(:path) {['a', 'long', 'way', 'to', 'go']}
      it_behaves_like "an input path"
    end

    context "and it is a set of names composed by dot" do
      subject    {RestModel::Key.new(:name, field: 'a.long.long.way.to.go')}
      let(:path) {['a', 'long', 'long', 'way', 'to', 'go']}
      it_behaves_like "an input path"
    end

    context "and it is a set of names composed by dot using :start_key instead of :field" do
      subject    {RestModel::Key.new(:name, start_key: 'a.long.way.to.go')}
      let(:path) {['a', 'long', 'way', 'to', 'go']}
      it_behaves_like "an input path"
    end

    context "and there is a custom keys input converter" do
      let(:options) {{start_key: 'yay.upcase.path', convert_input_keys: InputKeysConverterStrategy}}
      subject {RestModel::Key.new(:name, options)}
      let(:path) {['YAY', 'UPCASE', 'PATH']}
      it_behaves_like "an input path"
    end
  end
end
