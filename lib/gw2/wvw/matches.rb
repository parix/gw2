module GW2
  module WvW
    def self.matches
      parse(request("/wvw/matches.json").body)
    end
  end
end
