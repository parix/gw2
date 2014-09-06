require "gw2/https"
require "gw2/json"

module GW2
  class ApiInterface
    extend HTTPS
    extend JSON
  end
end
