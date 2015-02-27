module GW2
  module Misc
    extend Resource

    def self.build
      get("/build.json")["build_id"]
    end

    def self.colors
      get("/colors.json")["colors"]
    end

    def self.files
      get("/files.json")
    end
  end
end
