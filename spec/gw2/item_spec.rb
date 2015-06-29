require "spec_helper"

describe GW2::Item do
  describe ".ids" do
    before :each do
      @items = [12546, 12547, 12548, 12549]
    end

    it "exists" do
      expect(GW2::Item.respond_to?(:ids)).to eq(true)
    end

    it "returns all items", :vcr do
      expect(GW2::Item.ids).to include(*@items)
    end
  end

  describe ".find" do
    before :each do
      @item_details = {
        "name" => "Strong Soft Wood Longbow of Fire",
        "description" => "",
        "type" => "Weapon",
        "level" => 44,
        "rarity" => "Masterwork",
        "vendor_value" => 120,
        "default_skin" => 3942,
        "game_types" => ["Activity", "Dungeon", "Pve", "Wvw"],
        "flags" => ["SoulBindOnUse"],
        "restrictions" => [],
        "id" => 28445,
        "icon" => "https://render.guildwars2.com/file/C6110F52DF5AFE0F00A56F9E143E9732176DDDE9/65015.png",
        "details" => {
          "type" => "LongBow",
          "damage_type" => "Physical",
          "min_power" => 385,
          "max_power" => 452,
          "defense" => 0,
          "infusion_slots" => [],
          "infix_upgrade" => {
            "attributes" => [
              { "attribute" => "Power", "modifier" => 85 },
              { "attribute" => "Precision","modifier" => 61 }
            ]
          },
          "suffix_item_id" => 24547,
          "secondary_suffix_item_id" => ""
        }
      }
    end

    it "exists" do
      expect(GW2::Item.respond_to?(:find)).to eq(true)
    end

    it "returns the details of the item", :vcr do
      expect(GW2::Item.find(28445)).to eq(@item_details)
    end
  end
end
