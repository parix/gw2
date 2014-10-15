require "spec_helper"

describe GW2::Map do
  describe ".all" do
    let(:endpoint) { "/maps.json" }
    subject(:parsed_result) { GW2::Map.all }

    include_examples "an API response parser"
  end

  describe ".where" do
    let(:endpoint) { "/maps.json?map_id=80" }
    subject(:parsed_result) { GW2::Map.where(map_id: 80) }

    include_examples "an API response parser"
  end

  describe ".map_floor" do
    let(:endpoint) { "/map_floor.json?continent_id=1&floor=1" }
    subject(:parsed_result) { GW2::Map.map_floor(1, 1) }

    include_examples "an API response parser"
  end

  describe ".continents" do
    let(:endpoint) { "/continents.json" }
    subject(:parsed_result) { GW2::Map.continents }

    include_examples "an API response parser"
  end
end
