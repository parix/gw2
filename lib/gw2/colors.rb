module GW2
  module Colors
    extend Resource

    def self.all
      get("/colors.json")
    end

    def self.details(color_id)
      get("/colors/#{color_id}.json")
    end
  end
end
