module GW2
  class Item < ApiRequest
    def self.all
      get :items
    end

    def self.details(item_id)
      get :item_details, item_id: item_id
    end
  end
end
