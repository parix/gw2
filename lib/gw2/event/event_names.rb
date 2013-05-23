module GW2
  module Event
    def self.event_names
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/event_names.json"
      )

      return JSON.parse(response.body)
    end
  end
end
