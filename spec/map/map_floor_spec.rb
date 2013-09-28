require "spec_helper"

describe GW2::Map do
  describe "methods" do
    context "#map_floor" do
      before :each do
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
      end

      it "exists" do
        GW2::Map.respond_to?(:map_floor).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2::Map.map_floor(1, 1).should == @floors
      end
    end
  end
end
