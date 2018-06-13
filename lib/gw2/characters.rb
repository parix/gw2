module GW2
  module Characters
    extend Resource

    def self.all
      get("/characters.json?access_token=#{GW2.api_key}")
    end

    def self.details(character_name)
      get("/characters/#{character_name}.json?access_token=#{GW2.api_key}")
    end
  end
end
