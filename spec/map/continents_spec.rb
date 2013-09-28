require "spec_helper"

describe GW2::Map do
  describe "methods" do
    context "#continents" do
      before :each do
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
      end

      it "exists" do
        GW2::Map.respond_to?(:continents).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2::Map.continents.should == { "continents" => @continents }
      end
    end
  end
end
