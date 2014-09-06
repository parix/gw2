module GW2
  class Event < ApiRequest
    def self.all
      where
    end

    def self.where(query_hash = {})
      get :events, query_hash
    end

    def self.event_names
      get :event_names
    end

    def self.map_names
      get :map_names
    end

    def self.world_names
      get :world_names
    end
  end
end
