require "spec_helper"

describe GW2::Item do
  describe "methods" do
    context "#details" do
      before :each do
        @item_details = {
          "item_id" => "12546",
          "name" => "Lemongrass",
          "description" => "Ingredient",
          "type" => "CraftingMaterial",
          "level" => "80",
          "rarity" => "Basic",
          "vendor_value" => "9",
          "game_types" => ["Activity","Dungeon","Pve","Wvw"],
          "flags" => [],
          "restrictions" => [],
          "crafting_material" => ""
        }

        stub_request(:get, "https://api.guildwars2.com/v1/item_details.json?item_id=12546").
          to_return(:status => 200, :body => @item_details.to_json)
      end

      it "exists" do
        GW2::Item.respond_to?(:details).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Item.details(12546).should == @item_details
      end
    end
  end
end
