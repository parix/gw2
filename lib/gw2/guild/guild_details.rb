module GW2
  module Guild
    def self.details(query_hash = {})
      parse(request("/guild_details.json", query: query_hash).body)
    end
  end
end
