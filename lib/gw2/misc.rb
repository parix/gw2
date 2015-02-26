module GW2
  module Misc
    extend HTTPS
    extend JSON

    def self.build
      parse(request("/build.json").body)["build_id"]
    end

    def self.colors
      parse(request("/colors.json").body)["colors"]
    end

    def self.files
      parse(request("/files.json").body)
    end
  end
end
