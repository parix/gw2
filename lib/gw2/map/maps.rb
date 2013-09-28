module GW2
  module Map
    def self.all
      self.where
    end

    def self.where(map_id = {})
      url = "#{BASE_URL}/maps.json"
      query_string = map_id.collect { |k,v| "#{v}" }.join
      url += "?map_id=#{query_string}" unless query_string.empty?

      response = request(
        action: "Get",
        ssl: true,
        url: url
      )

      return JSON.parse(response.body)
    end
  end
end
