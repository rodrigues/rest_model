require 'spec_helper'

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

  context "when using not allowed names" do
    [:resource_id, :resource, :links].each do |unallowed|
      it "removes method #{unallowed}" do
        output = OutputHelper.get_output do
          eval <<-RUBY
            class Example < Resource
              def #{unallowed}
              end
            end
          RUBY
        end
        output.should =~ /^warning: redefining '#{unallowed}' may cause serious problems/
      end

      %w(property embeds_one embeds_many has_one has_many belongs_to).each do |kind|
        it "removes method #{unallowed} created by #{kind}" do
          output = OutputHelper.get_output do
            eval <<-RUBY
              class Example < Resource
                #{kind} :#{unallowed}
              end
            RUBY
          end
          output.should =~ /warning: redefining '#{unallowed}' may cause serious problems/
        end
      end
    end
  end
end
