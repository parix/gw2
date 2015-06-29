require "spec_helper"

describe GW2::Recipe do
  describe ".ids" do
    before :each do
      @recipes = [1275, 1276, 1277, 1278, 1279]
    end

    it "exists" do
      expect(GW2::Recipe.respond_to?(:ids)).to eq(true)
    end

    it "returns all recipes", :vcr do
      expect(GW2::Recipe.ids).to include(*@recipes)
    end
  end

  describe ".find" do
    before :each do
      @recipe_details = {
        "type" => "RefinementEctoplasm",
        "output_item_id" => 46742,
        "output_item_count" => 1,
        "min_rating" => 450,
        "time_to_craft_ms" => 5000,
        "disciplines" => [ "Armorsmith", "Artificer", "Huntsman", "Weaponsmith" ],
        "flags" => [ "AutoLearned" ],
        "ingredients" => [
          { "item_id" => 19684, "count" => 50 },
          { "item_id" => 19721, "count" => 1 },
          { "item_id" => 46747, "count" => 10 }
        ],
        "id" => 7319
      }
    end

    it "exists" do
      expect(GW2::Recipe.respond_to?(:find)).to eq(true)
    end

    it "returns the details of a recipe by id", :vcr do
      expect(GW2::Recipe.find(7319)).to eq(@recipe_details)
    end
  end
end
