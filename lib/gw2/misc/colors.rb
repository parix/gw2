module GW2
  module Misc
    def self.colors
      parse(request("/colors.json").body)["colors"]
    end
  end
end
