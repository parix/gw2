require "spec_helper"

describe GW2::Guild do
  describe ".details" do
    before :each do
      @guild = {
        "guild_id" => "16DB5921-CF1B-48D2-A5A0-2F0AADD9765D",
        "guild_name" => "Ruinous",
        "tag" => "RUIN",
        "emblem" => {
          "background_id" => 25,
          "foreground_id" => 70,
          "flags" => [],
          "background_color_id" => 473,
          "foreground_primary_color_id" => 146,
          "foreground_secondary_color_id" => 146
        }
      }
    end

    it "exists" do
      expect(GW2::Guild.respond_to?(:details)).to eq(true)
    end

    it "returns the guild based on id", :vcr do
      expect(GW2::Guild.details(guild_id: "16DB5921-CF1B-48D2-A5A0-2F0AADD9765D")).to eq(@guild)
    end

    it "returns the guild based on name", :vcr do
      expect(GW2::Guild.details(guild_name: "Ruinous")).to eq(@guild)
    end
  end
end
