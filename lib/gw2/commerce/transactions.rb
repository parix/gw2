module GW2
  module Commerce
    module Transactions
      extend Resource
      def self.current(mode = "buys")
        get("/commerce/transactions/current/#{mode}.json", headers: {Authorization: "Bearer #{GW2.key}"})
      end
    end
  end
end
