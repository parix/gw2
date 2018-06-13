module GW2
  module Misc
    extend Resource

    def self.build
      get("/build.json")["id"]
    end

    def self.files
      get("/files.json", query: { ids: "all" })
    end

    def self.worlds
      get("/worlds.json", {ids: "all"})
    end
  end
end
