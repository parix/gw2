module GW2
  module Event
    def self.all
      raise GW2::Disabled, "This endpoint is disabled due to the implementation of Megaserver technology."
    end

    def self.where(query_hash = {})
      raise GW2::Disabled, "This endpoint is disabled due to the implementation of Megaserver technology."
    end
  end
end
