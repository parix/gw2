module GW2
  module Item 
    def self.details(item_id)
      response = request(
        action: "Get",
        ssl: true,
        url: "#{BASE_URL}/item_details.json?item_id=#{item_id}"
      )

      return JSON.parse(response.body)
    end
  end
end
