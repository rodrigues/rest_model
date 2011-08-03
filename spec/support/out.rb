module Output
  def out
    output  = StringIO.new
    $stdout = output
    yield
  ensure
    $stdout = STDOUT
    output
  end

  def silently
    out {yield}
    nil
  end
end
