module GW2
  module Misc
    def self.build
      parse(request("/build.json").body)
    end
  end
end

