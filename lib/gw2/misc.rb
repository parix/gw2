module GW2
  module Misc
    extend Resource

    def self.build
      get("/build.json")
    end

    def self.files
      get("/files.json", {ids: "all"})
    end

    def self.worlds
      get("/worlds.json", {ids: "all"})
    end
  end
end
