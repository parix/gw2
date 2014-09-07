module ApiHelper
  def endpoint_uri(*args)
    GW2::HTTPS.endpoint_uri(*args)
  end
end
