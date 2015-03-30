module GW2
  module Commerce
    module Listings
      extend Resource

      def self.all
        get("/commerce/listings.json")
      end

      def self.details(listing_id)
        get("/commerce/listings/#{listing_id}.json")
      end

    end
  end
end
