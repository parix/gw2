module GW2
  class Item < ApiInterface
    def self.all
      parse(request("/items.json").body)
    end

    def self.details(item_id)
      parse(request("/item_details.json", query: { item_id: item_id }).body)
    end
  end
end
