module Ion::Server::JsonHelpers
  def json_output(what)
    # Hmm, needs error handling?
    res["Content-Type"] = 'application/json'
    output = what.to_json
    res.write output
  end

  def error(str)
    res.status = 400
    json_output 'message' => str
  end

  def ok
    json_output 'success' => 1
  end
end

