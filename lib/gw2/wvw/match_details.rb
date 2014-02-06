module GW2
  module WvW
    def self.match_details(match_id)
      parse(request("/wvw/match_details.json", query: { match_id: match_id }).body)
    end
  end
end
