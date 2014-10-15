module GW2
  class Misc < ApiRequest
    def self.build
      get :build
    end

    def self.colors
      get :colors
    end

    def self.files
      get :files
    end
  end
end
