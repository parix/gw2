module GW2
  module Dye
    def self.all
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/colors.json"
      )

      return JSON.parse(response.body)
    end
  end
end
