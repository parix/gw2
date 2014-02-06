module GW2
  module Misc
    def self.files
      parse(request("/files.json").body)
    end
  end
end
