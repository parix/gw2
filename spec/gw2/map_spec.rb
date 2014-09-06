require "spec_helper"

describe GW2::Map do
  describe ".all" do
    it "returns the correct JSON parsed data" do
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

      GW2::Map.all.should == { "maps" => @maps }
    end
  end

  describe ".maps" do
    it "returns the correct JSON parsed data" do
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

      GW2::Map.where(map_id: 80).should == { "maps" => @maps }
    end
  end

  describe ".map_floor" do
    it "returns the correct JSON parsed data" do
      @floors = {
        "texture_dims" => [ 32768, 32768 ],
        "regions" => {
          "1" => {
            "name" => "Shiverpeak Mountains",
            "label_coord" => [ 19840, 13568 ],
            "maps" => {
              "31" => {
                "name" => "Snowden Drifts",
                "min_level" => 15,
                "max_level" => 25,
                "default_floor" => 1,
                "map_rect" => [
                  [ -49152, -24576 ],
                  [ 49152, 24576 ]
                ],
                "continent_rect" => [
                  [ 17664, 11264 ],
                  [ 21760, 13312 ]
                ],
                "points_of_interest" => [
                  {
                    "poi_id" => 164,
                    "name" => "Blasted Haven",
                    "type" => "landmark",
                    "floor" => 1,
                    "coord" => [ 20768.5, 11893.5 ]
                  }
                ],
                "tasks" => [
                  {
                    "task_id" => 28,
                    "objective" => "Help hunters and travelers near the road.",
                    "level" => 15,
                    "coord" => [ 21326.4, 11982.8 ]
                  }
                ],
                "skill_challenges" => [
                  {
                    "coord" => [ 18922.3, 11445.5 ]
                  }
                ],
                "sectors" => [
                  {
                    "sector_id" => 1015,
                    "name" => "King Jalis's Refuge",
                    "level" => 19,
                    "coord" => [ 21673.8, 12111.8 ]
                  }
                ]
              },
            }
          }
        }
      }

      stub_request(:get, "https://api.guildwars2.com/v1/map_floor.json?continent_id=1&floor=1").
        to_return(:status => 200, :body => @floors.to_json)

      GW2::Map.map_floor(1, 1).should == @floors
    end
  end

  describe ".continents" do
    it "returns the correct JSON parsed data" do
      @continents = {
        "1" => {
          "name" => "Tyria",
          "continent_dims" => [ 32768, 32768 ],
          "min_zoom" => 0,
          "max_zoom" => 7,
          "floors" => [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
              18, 19, 30, -2, -3, -4, -5, -6, -7, -8, -10, -11, -15, -16, -17, 38,
              20, 21, 22, 23, 24, 25, 26, 27, 34, 36, 37 ]
        },
        "2" => {
          "name" => "Mists",
          "continent_dims" => [ 16384, 16384 ],
          "min_zoom" => 0,
          "max_zoom" => 6,
          "floors" => [ 1, 3, 5, 6, 7, 8, 9, 10, 13, 14, 18, 19, 21, 22, 23, 24, 25,
              26, -27, -28, -29, -30, -31, -32, -33, 27 ]
        }
      }

      stub_request(:get, "https://api.guildwars2.com/v1/continents.json").
        to_return(:status => 200, :body => { "continents" => @continents }.to_json)

      GW2::Map.continents.should == { "continents" => @continents }
    end
  end
end
