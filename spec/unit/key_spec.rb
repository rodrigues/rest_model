require 'spec_helper'

describe RestModel::Key do
  let(:name)    {"key_name"}
  let(:options) {{any_option: "here"}}

  subject {RestModel::Property.new(name, options)}

  describe "#initialize" do
    it "sets key name" do
      subject.name.should == name
    end

    it "sets options" do
      subject.options.should == options
    end
  end

  describe "#visible?" do
    context "when :visible option was defined" do
      context "and :if option was defined with false" do
        subject {RestModel::Property.new(name, {if: proc {false}, visible: true})}
        it "return false even when visible is true" do
          subject.visible?(nil).should be_false
        end
      end

      context "and it evaluates to false" do
        subject {RestModel::Property.new(name, {visible: false})}

        it "returns false" do
          subject.visible?(nil).should be_false
        end
      end

      context "and it evaluates to true" do
        subject {RestModel::Property.new(name, {visible: true})}

        it "returns true" do
          subject.visible?(nil).should be_true
        end
      end

      context "with a proc" do
        context "and it evaluates true" do
          subject {RestModel::Property.new(name, {visible: proc {true}})}
          it "returns true" do
            subject.visible?("a").should be_true
          end
        end

        context "and it evaluates false" do
          subject {RestModel::Property.new(name, {visible: proc {false}})}
          it "returns false" do
            subject.visible?("a").should be_false
          end
        end

        context "and it depends on resource instance" do
          subject {RestModel::Property.new(name, {visible: proc {show}})}

          it "uses it" do
            resource = OpenStruct.new
            resource.show = true
            subject.visible?(resource).should be_true
          end
        end
      end
    end
  end

  describe "#present?" do
    context "when :if option was defined with a proc" do
      context "and it evaluates to false" do
        subject {RestModel::Property.new(name, {if: proc {false}})}

        it "returns false" do
          subject.present?(nil).should be_false
        end
      end

      context "and it evaluates to true" do
        subject {RestModel::Property.new(name, {if: proc {true}})}

        it "returns true" do
          subject.present?(nil).should be_true
        end
      end

      context "and it depends on resource instance" do
        subject {RestModel::Property.new(name, {if: proc {show}})}

        it "uses it" do
          resource = OpenStruct.new
          resource.show = true
          subject.present?(resource).should be_true
        end
      end
    end
  end
end
