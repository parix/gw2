module GW2
  module Item
    extend Resource

    def self.all
      get("/items.json")["items"]
    end

    def self.details(item_id)
      get("/item_details.json", { item_id: item_id })
    end
  end
end
