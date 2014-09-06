module GW2
  class Guild < ApiRequest
    def self.details(query_hash = {})
      get :guild_details, query_hash
    end
  end
end
