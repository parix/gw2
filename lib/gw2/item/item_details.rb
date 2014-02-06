module GW2
  module Item
    def self.details(item_id)
      parse(request("/item_details.json", query: { item_id: item_id }).body)
    end
  end
end
