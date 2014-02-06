module GW2
  module Event
    def self.map_names
      parse(request("/map_names.json").body)
    end
  end
end
