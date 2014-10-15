module ApiHelper
  def endpoint_uri(*args)
    GW2::HTTPS.endpoint_uri(*args)
  end

  def stub_endpoint(endpoint)
    stub_request :get, endpoint_uri(endpoint)
  end
end
