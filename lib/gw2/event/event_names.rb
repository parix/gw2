module GW2
  module Event
    def self.event_names
      parse(request("/event_names.json").body)
    end
  end
end
