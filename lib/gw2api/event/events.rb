module GW2API
  module Event
    PARAMS_FILTER = [:world_id, :map_id, :event_id] 

    def self.events(query_params = {})
      url = "#{BASE_URL}/events.json"
      query_string = query_params.select{ |k,v| PARAMS_FILTER.include?(k) }.collect{ |k,v| "#{k}=#{v}" }.join("&")
      url += "?#{query_string}" unless query_string.empty?

      response = request(
        action: "Get",
        ssl: true,
        url: url 
      )

      return JSON.parse(response.body)
    end
  end
end
