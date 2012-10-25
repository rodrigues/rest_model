require "spec_helper"

describe RestModel::Logger do
  subject {RestModel::Logger}

  let(:logger_mock) {mock(:logger)}

  before {RestModel::Logger.handler = logger_mock}
  after  {RestModel::Logger.handler = nil}

  describe "#new_log_id" do
    it "returns a random string" do
      subject.new_log_id.should_not == subject.new_log_id
    end

    it "returns a 6 character string" do
      subject.new_log_id.size.should == 6
    end
  end

  RestModel::Logger::SEVERITIES.each do |severity|
    context "when not running in verbose mode" do
      before do
        @old_verbose = ENV["VERBOSE"]
        ENV["VERBOSE"] = ""
      end

      after {ENV["VERBOSE"] = @old_verbose}

      describe "##{severity}" do
        it "logs #{severity} calls" do
          message = "about anything"
          logger_mock.should_receive(:send).with(severity, "[#{severity}]: [#{subject.log_id}] #{message}")
          subject.send(severity, message)
        end

        it "doesn't print #{severity} calls on output" do
          message = "about anything"
          logger_mock.should_receive(:send).with(severity, "[#{severity}]: [#{subject.log_id}] #{message}")
          subject.should_not_receive(:puts)
          subject.send(severity, message)
        end
      end

      context "when run in verbose mode" do
        before do
          @old_verbose = ENV["VERBOSE"]
          ENV["VERBOSE"] = "true"
        end

        after {ENV["VERBOSE"] = @old_verbose}

        it "logs #{severity} calls" do
          message = "about anything"
          logger_mock.should_receive(:send).with(severity, "[#{severity}]: [#{subject.log_id}] #{message}")
          subject.stub!(:puts)
          subject.send(severity, message)
        end

        it "prints #{severity} calls on output" do
          message = "about anything"
          logger_mock.stub(:send).with(severity, "[#{severity}]: [#{subject.log_id}] #{message}")
          subject.should_receive(:puts).with(/#{message}$/)
          subject.send(severity, message)
        end
      end
    end
  end
end
