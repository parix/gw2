module GW2
  module Misc
    def self.build
      parse(request("/build.json").body)["build_id"]
    end
  end
end

