module GW2
  module Commerce
    module Exchange
      extend Resource

      def self.all
        get("/commerce/exchange.json")
      end

      def self.details(exchange_type, quantity)
        get("/commerce/exchange/#{exchange_type}.json", {quantity: quantity})
      end
    end
  end
end
