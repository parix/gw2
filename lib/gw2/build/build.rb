module GW2
  module Build
    def self.current
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/build.json"
      )

      return JSON.parse(response.body)
    end
  end
end