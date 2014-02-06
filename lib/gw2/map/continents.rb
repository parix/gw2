module GW2
  module Map
    def self.continents
      parse(request("/continents.json").body)
    end
  end
end
