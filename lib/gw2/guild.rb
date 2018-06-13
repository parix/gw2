module GW2
  module Guild
    extend Resource

    def self.details(query = {})
      get("/guild_details.json", query: query)
    end
  end
end
