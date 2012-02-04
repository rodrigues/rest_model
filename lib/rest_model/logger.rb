module Logger
  extend self

  SEVERITIES = %w(info debug error warn fatal unknow)

  def self.default_handler
    @default_handler ||= Slogger::CommonLogger.new("rest_model", :info, :local7)
  end

  def self.handler
    @handler ||= default_handler
  end

  def self.handler=(handler)
    @handler = handler
  end

  def new_log_id
    @@log_id = SecureRandom.hex(3)
  end

  def log_id
    @@log_id ||= new_log_id
  end

  SEVERITIES.each do |severity|
    define_method severity do |text|
      log_text = "[#{severity}]: [#{log_id}] #{text}"
      puts "#{log_text}" if ENV["VERBOSE"] == "true"
      handler.send(severity, log_text)
    end
  end
end
