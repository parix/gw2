require "spec_helper"

describe GW2::Guild do
  describe ".details" do
    it "returns the correct JSON parsed data" do
      @guild_details = {
        "guild_id" => "16DB5921-CF1B-48D2-A5A0-2F0AADD9765D",
        "guild_name" => "Ruinous",
        "tag" => "RUIN",
        "emblem" => {
          "background_id" => 8,
          "foreground_id" => 21,
          "flags" => [],
          "background_color_id" => 473,
          "foreground_primary_color" => 146,
          "foreground_seconary_color" => 146
        }
      }

      stub_request(:get, "https://api.guildwars2.com/v1/guild_details.json?guild_id=16DB5921-CF1B-48D2-A5A0-2F0AADD9765D").
        to_return(:status => 200, :body => @guild_details.to_json)
      stub_request(:get, "https://api.guildwars2.com/v1/guild_details.json?guild_name=Ruinous").
        to_return(:status => 200, :body => @guild_details.to_json)

      GW2::Guild.details(guild_id: "16DB5921-CF1B-48D2-A5A0-2F0AADD9765D").should == @guild_details
      GW2::Guild.details(guild_name: "Ruinous").should == @guild_details
    end
  end
end
