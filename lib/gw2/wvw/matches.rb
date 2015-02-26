module GW2
  module WvW
    def self.matches
      parse(request("/wvw/matches.json").body)["wvw_matches"]
    end
  end
end
