module GW2API
  module WvW
    def self.objective_names
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/wvw/objective_names.json"
      )

      return JSON.parse(response.body)
    end
  end
end
