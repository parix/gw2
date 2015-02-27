module GW2
  module WvW
    extend Resource

    def self.matches
      get("/wvw/matches.json")["wvw_matches"]
    end

    def self.match_details(match_id)
      get("/wvw/match_details.json", match_id: match_id)["maps"]
    end

    def self.objective_names
      get("/wvw/objective_names.json")
    end
  end
end
