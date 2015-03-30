require "net/https"

module GW2
  module HTTPS
    DEFAULT_REQUEST = { action: "Get", ssl: true }
    V1_ENDPOINTS = ["world_names", "event_names", "guild_details", "wvw"]
    def query_string(query_hash = {})
      string = query_hash.collect{ |k,v| "#{k}=#{v}" }.join("&")
      string.prepend("?") unless string.empty?

      string
    end

    def request(end_point = "", attr = {})
      attr = DEFAULT_REQUEST.merge(attr)

      if V1_ENDPOINTS.any? { |word| end_point.include?(word) }
        uri = URI.parse(BASE_URL_V1 + end_point + query_string(attr[:query] || {}))
      else
        uri = URI.parse(BASE_URL_V2 + end_point + query_string(attr[:query] || {}))
      end

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = attr[:ssl]
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if attr[:ssl] # need to get a cert -_____-

      net_http = Net::HTTP
      request = Net::HTTP.const_get(attr[:action]).new(uri.request_uri)
      attr[:headers].each { |key, value| request[key.to_s] = value } if attr[:headers]

      request.set_form_data(attr[:form_data]) if attr[:form_data]

      http.request(request)
    end
  end
end
