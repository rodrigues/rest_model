module Output
  def out
    output  = StringIO.new
    begin
      $stdout = output
      yield
    ensure
      $stdout = STDOUT
    end
    output.string
  end

  def silently
    out {yield}
    nil
  end
end
