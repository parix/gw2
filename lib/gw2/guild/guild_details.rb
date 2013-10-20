module GW2
  module Guild
    PARAMS_FILTER = [:guild_id, :guild_name] 

    def self.details(query_params)
      url = "#{BASE_URL}/guild_details.json"
      query_string = query_params.select{ |k,v| PARAMS_FILTER.include?(k) }.collect { |k,v| "#{k}=#{v}" }.join("&")
      url += "?#{query_string}"

      response = request(
        action: "Get",
        ssl: true,
        url: url
      )

      return JSON.parse(response.body)
    end
  end
end