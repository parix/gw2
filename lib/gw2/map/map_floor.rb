module GW2
  module Map
    def self.map_floor(continent_id, floor)
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/map_floor.json?continent_id=#{continent_id}&floor=#{floor}"
      )

      return JSON.parse(response.body)
    end
  end
end
