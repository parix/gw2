module GW2
  class WvW < ApiRequest
    def self.matches
      get [:wvw, :matches]
    end

    def self.match_details(match_id)
      get [:wvw, :match_details], match_id: match_id
    end

    def self.objective_names
      get [:wvw, :objective_names]
    end
  end
end
