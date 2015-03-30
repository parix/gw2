module GW2
  module Skins
    extend Resource

    def self.all
      get("/skins.json")
    end

    def self.details(skin_id)
      get("/skins/#{skin_id}.json")
    end
  end
end
