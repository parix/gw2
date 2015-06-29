module GW2
  module Item
    extend Resource

    def self.ids
      get("/items")
    end

    def self.find(item_id)
      get("/items/#{item_id}")
    end
  end
end
