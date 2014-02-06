require "json"

module GW2
  module JSON
    def parse(string)
      ::JSON.parse(string)
    end
  end
end
