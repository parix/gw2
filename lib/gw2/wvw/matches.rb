module GW2
  module WvW
    def self.matches
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/wvw/matches.json"
      )

      return JSON.parse(response.body)
    end
  end
end
