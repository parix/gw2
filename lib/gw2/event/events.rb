module GW2
  module Event
    def self.all
      self.where
    end

    def self.where(query_hash = {})
      parse(request("/events.json", query: query_hash).body)
    end
  end
end
