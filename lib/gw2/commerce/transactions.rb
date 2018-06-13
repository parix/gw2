module GW2
  module Commerce
    module Transactions
      extend Resource
      def self.current(mode = "buys")
        get("/commerce/transactions/current/#{mode}.json?access_token=#{GW2.api_key}")
      end
    end
  end
end
