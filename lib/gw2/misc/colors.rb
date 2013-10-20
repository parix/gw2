module GW2
  module Misc
    def self.colors
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/colors.json"
      )

      return JSON.parse(response.body)
    end
  end
end
