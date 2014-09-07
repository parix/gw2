require "spec_helper"

describe GW2::Guild do
  describe ".details" do
    let(:guild_id) { "16DB5921-CF1B-48D2-A5A0-2F0AADD9765D" }
    let(:guild_name) { "Ruinous" }
    let(:guild_details) do
      {
        "guild_id" => guild_id,
        "guild_name" => guild_name,
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
    end

    it "returns guild details for a guild ID" do
      stub_endpoint("/guild_details.json?guild_id=#{guild_id}").
        to_return(body: guild_details.to_json)

      GW2::Guild.details(guild_id: guild_id).should == guild_details
    end

    it "returns guild details for a guild name" do
      stub_endpoint("/guild_details.json?guild_name=#{guild_name}").
        to_return(body: guild_details.to_json)

      GW2::Guild.details(guild_name: guild_name).should == guild_details
    end
  end
end
