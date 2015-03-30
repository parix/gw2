module GW2
  module Commerce
    module Listings
      extend Resource

      def self.all
        get("/commerce/prices.json")
      end

      def self.details(pricing_id)
        get("/commerce/prices/#{pricing_id}.json")
      end

    end
  end
end
