module GW2
  module Item
    extend HTTPS
    extend JSON

    def self.all
      parse(request("/items.json").body)["items"]
    end

    def self.details(item_id)
      parse(request("/item_details.json", query: { item_id: item_id }).body)
    end
  end
end
