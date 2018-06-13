require "spec_helper"

describe GW2::Skins do
  describe ".all" do
    before :each do
      @skins = [5904, 5907]
    end

    it "exists" do
      expect(GW2::Skins.respond_to?(:all)).to eq(true)
    end

    it "returns all Skins", :vcr do
      expect(GW2::Skins.all).to include(*@skins)
    end
  end

  describe ".details" do
    before :each do
      @skin_details = {
        "name" => "Shadow Hammer",
        "rarity" => "Basic",
        "type" => "Weapon",
        "flags" => ["ShowInWardrobe"],
        "restrictions" => [],
        "id" => 5904,
        "icon" => "https://render.guildwars2.com/file/0766F6FB807B2821C5264ED7781FA7F8DE66A60E/960252.png",
        "details" => { "type" => "Hammer", "damage_type" => "Physical" }
      }
    end

    it "exists" do
      expect(GW2::Skins.respond_to?(:details)).to eq(true)
    end

    it "returns the details of the skin", :vcr do
      expect(GW2::Skins.details(5904)).to eq(@skin_details)
    end
  end
end
