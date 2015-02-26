module GW2
  module WvW
    extend HTTPS
    extend JSON

    def self.matches
      parse(request("/wvw/matches.json").body)["wvw_matches"]
    end

    def self.match_details(match_id)
      parse(request("/wvw/match_details.json", query: { match_id: match_id }).body)["maps"]
    end

    def self.objective_names
      parse(request("/wvw/objective_names.json").body)
    end
  end
end
