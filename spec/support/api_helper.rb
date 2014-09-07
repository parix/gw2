module ApiHelper
  def endpoint_uri(*args)
    GW2::HTTPS.endpoint_uri(*args)
  end

  def stub_endpoint(endpoint, body:)
    request_uri = endpoint_uri(endpoint)
    stub_request(:get, request_uri).to_return(body: body)
  end
end
