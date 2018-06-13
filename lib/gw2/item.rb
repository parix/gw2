module GW2
  module Item
    extend Resource

    def self.all
      get("/items.json")
    end

    def self.details(item_id)
      get("/items/#{item_id}.json")
    end
  end
end
