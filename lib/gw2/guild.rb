module GW2
  module Guild
    extend Resource

    def self.details(query = {})
      get("/guild_details.json", query)
    end
  end
end
