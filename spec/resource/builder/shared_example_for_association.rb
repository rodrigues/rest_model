shared_examples_for "an association" do
  it "defines an attr_accessor with association name" do
    Example.new.tap do |example|
      example.respond_to?("#{field}").should be_true
      example.respond_to?("#{field}=").should be_true
    end
  end

  it "puts a new association in keys list" do
    Example.keys.find {|key| key.name == field}.name.should == field
  end

  it "supports option definition" do
    Example.keys.find {|key| key.name == field}.options.should == options
  end

  it "many? responds appropriately" do
    Example.keys.find {|key| key.name == field}.many?.should == many
  end
end
