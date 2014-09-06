module GW2
  class WvW < ApiRequest
    def self.matches
      get :matches
    end

    def self.match_details(match_id)
      get :match_details, match_id: match_id
    end

    def self.objective_names
      get :objective_names
    end
  end
end
