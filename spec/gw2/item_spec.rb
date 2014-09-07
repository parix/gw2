require "spec_helper"

describe GW2::Item do
  describe ".all" do
    it "returns the correct JSON parsed data" do
      items = [12546, 12547, 12548, 12549, 12550]

      response_body = { "items" => items }.to_json
      stub_endpoint("/items.json").to_return(body: response_body)

      GW2::Item.all.should == { "items" => items }
    end
  end

  describe ".details" do
    it "returns the correct JSON parsed data" do
      item_details = {
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

      stub_endpoint("/item_details.json?item_id=12546").
        to_return(body: item_details.to_json)

      GW2::Item.details(12546).should == item_details
    end
  end
end
