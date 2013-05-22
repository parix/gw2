module GW2API
  module WvW
    def self.match_details(match_id)
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/wvw/match_details.json?match_id=#{match_id}"
      )

      return JSON.parse(response.body)
    end
  end
end
