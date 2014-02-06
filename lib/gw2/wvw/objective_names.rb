module GW2
  module WvW
    def self.objective_names
      parse(request("/wvw/objective_names.json").body)
    end
  end
end
