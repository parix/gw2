module GW2
  module Event
    def self.world_names
      parse(request("/world_names.json").body)
    end
  end
end
