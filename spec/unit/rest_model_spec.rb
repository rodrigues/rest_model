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

  context "when using not allowed names" do
    [:resource_id, :resource, :link].each do |unallowed|
      it "warns when method #{unallowed} is redefined" do
        output = out do
          eval <<-RUBY
            class Example < RestModel
              def #{unallowed}
              end
            end
          RUBY
        end
        output.should =~ /^warning: redefining '#{unallowed}' may cause serious problems/
      end

      %w(property embeds_one embeds_many has_one has_many belongs_to).each do |kind|
        it "removes method #{unallowed} created by #{kind}" do
          expect {
            eval <<-RUBY
              class Example < RestModel
                #{kind} :#{unallowed}
              end
            RUBY
          }.to raise_error "you can't define a key with name '#{unallowed}'"
        end
      end
    end
  end
end
