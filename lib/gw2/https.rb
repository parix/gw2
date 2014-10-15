require "open-uri"

module GW2
  module HTTPS
    DEFAULT_REQUEST = { action: "Get", ssl: true, query: {} }

    def endpoint_uri(endpoint, query = {})
      URI.parse(BASE_URL + endpoint + query_string(query))
    end
    module_function :endpoint_uri

    def query_string(query_hash = {})
      string = query_hash.collect{ |k,v| "#{k}=#{v}" }.join("&")
      string.prepend("?") unless string.empty?

      string
    end
    module_function :query_string

    private

    def request(end_point, attr = {})
      attr = DEFAULT_REQUEST.merge(attr)
      uri = endpoint_uri(end_point, attr[:query])

      uri.read
    end
  end
end
