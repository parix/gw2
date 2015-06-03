require "gw2/json"
require "gw2/https"
require "gw2/resource"
require "gw2/event"
require "gw2/wvw"
require "gw2/item"
require "gw2/recipe"
require "gw2/guild"
require "gw2/misc"
require "gw2/colors"
require "gw2/quaggans"
require "gw2/skins"
require "gw2/map"
require "gw2/characters"
require "gw2/commerce/listings"
require "gw2/commerce/exchange"
require "gw2/commerce/prices"
require "gw2/commerce/transactions"
require "gw2/disabled"

module GW2
  attr_accessor :api_key

  BASE_URL_V1 = "https://api.guildwars2.com/v1"
  BASE_URL_V2 = "https://api.guildwars2.com/v2"
  V1_ENDPOINTS = ["world_names", "event_names", "guild_details", "wvw", "map_floor"]

  def self.api_key
    @api_key
  end

  def self.api_key=api_key
    @api_key = api_key
  end

end
