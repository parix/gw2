module GW2
  class Misc < ApiRequest
    def self.build
      parse(request("/build.json").body)
    end

    def self.colors
      parse(request("/colors.json").body)
    end

    def self.files
      parse(request("/files.json").body)
    end
  end
end
