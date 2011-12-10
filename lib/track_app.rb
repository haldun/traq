class TrackApp
  def self.call(env)
    request = Rack::Request.new(env)
    if Event.create_from_request!(request)
      return [200, {"Content-Type" => "text/plain"}, ["0"]]
    end
    return [400, {"Content-Type" => "text/plain"}, ["-1"]]
  end
end
