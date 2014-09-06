require "net/https"

module GW2
  module HTTPS
    DEFAULT_REQUEST = { action: "Get", ssl: true }

    def query_string(query_hash = {})
      string = query_hash.collect{ |k,v| "#{k}=#{v}" }.join("&")
      string.prepend("?") unless string.empty?

      string
    end

    def request(end_point = "", attr = {})
      attr = DEFAULT_REQUEST.merge(attr)
      uri = URI.parse(BASE_URL + end_point + query_string(attr[:query] || {}))

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = attr[:ssl]
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if attr[:ssl] # need to get a cert -_____-

      request = Net::HTTP.const_get(attr[:action]).new(uri.request_uri)
      attr[:headers].each { |key, value| request[key.to_s] = value } if attr[:headers]

      request.set_form_data(attr[:form_data]) if attr[:form_data]

      http.request(request)
    end
  end
end
