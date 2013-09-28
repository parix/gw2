module GW2
  module Misc
    def self.files
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/files.json"
      )

      return JSON.parse(response.body)
    end
  end
end
