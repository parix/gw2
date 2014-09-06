require "spec_helper"

describe GW2::Map do
  describe "methods" do
    context "#all" do
      before :each do
        @maps = {
          "80" => {
            "map_name" => "A Society Function",
            "min_level" => 8,
            "max_level" => 8,
            "default_floor" => 1,
            "floors" => [1, 2],
            "region_id" => 8,
            "region_name" => "Steamspur Mountains",
            "continent_id" => 1,
            "continent_name" => "Tyria",
            "map_rect" => [
              [-21504, -21504],
              [24576, 21504]
            ],
            "continent_rect" => [
              [10240, 9856],
              [12160, 11648]
            ]
          }
        }

        stub_request(:get, "https://api.guildwars2.com/v1/maps.json").
          to_return(:status => 200, :body => { "maps" => @maps }.to_json)
      end

      it "exists" do
        GW2::Map.respond_to?(:all).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Map.all.should == { "maps" => @maps }
      end
    end

    context "#maps" do
      before :each do
        @maps = {
          "80" => {
            "map_name" => "A Society Function",
            "min_level" => 8,
            "max_level" => 8,
            "default_floor" => 1,
            "floors" => [1, 2],
            "region_id" => 8,
            "region_name" => "Steamspur Mountains",
            "continent_id" => 1,
            "continent_name" => "Tyria",
            "map_rect" => [
              [-21504, -21504],
              [24576, 21504]
            ],
            "continent_rect" => [
              [10240, 9856],
              [12160, 11648]
            ]
          }
        }

        stub_request(:get, "https://api.guildwars2.com/v1/maps.json?map_id=80").
          to_return(:status => 200, :body => { "maps" => @maps }.to_json)
      end

      it "exists" do
        GW2::Map.respond_to?(:where).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Map.where(map_id: 80).should == { "maps" => @maps }
      end
    end
  end
end
