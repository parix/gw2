module GW2
  module Item
    def self.all
      parse(request("/items.json").body)
    end
  end
end
