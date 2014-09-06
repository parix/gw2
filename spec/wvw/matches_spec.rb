require "spec_helper"

describe GW2::WvW do
  describe "methods" do
    context "#matches" do
      before :each do
        @matches = [
          { "wvw_match_id" => "2-3", "red_world_id" => 2103, "blue_world_id" => 2301, "green_world_id" => 2012 },
          { "wvw_match_id" => "2-2", "red_world_id" => 2201, "blue_world_id" => 2010, "green_world_id" => 2101 }
        ]

        stub_request(:get, "https://api.guildwars2.com/v1/wvw/matches.json").
          to_return(:status => 200, :body => { "wvw_matches" => @matches }.to_json)
      end

      it "exists" do
        GW2::WvW.respond_to?(:matches).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::WvW.matches.should == { "wvw_matches" => @matches }
      end
    end
  end
end
