module GW2
  module Quaggans
    extend Resource

    def self.all
      get("/quaggans.json")
    end

    def self.details(quaggan_name)
      get("/quaggans/#{quaggan_name}.json")
    end
  end
end
