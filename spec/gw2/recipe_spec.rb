require "spec_helper"

describe GW2::Recipe do
  describe ".all" do
    before :each do
      @recipes = [1275, 1276, 1277, 1278, 1279]
    end

    it "exists" do
      expect(GW2::Recipe.respond_to?(:all)).to eq(true)
    end

    it "returns all recipes", :vcr do
      expect(GW2::Recipe.all).to include(*@recipes)
    end
  end

  describe ".details" do
    before :each do
      @recipe_details = {
        "recipe_id" => "1275",
        "type" => "Coat",
        "output_item_id" => "11541",
        "output_item_count" => "1",
        "min_rating" => "25",
        "time_to_craft_ms" => "1000",
        "disciplines"=>["Leatherworker"],
        "flags"=>[],
        "ingredients" => [
          {"item_id" => "19797","count" => "1"},
          {"item_id" => "13094","count" => "1"},
          {"item_id" => "13093","count" => "1"}
        ]
      }
    end

    it "exists" do
      expect(GW2::Recipe.respond_to?(:details)).to eq(true)
    end

    it "returns the details of a recipe by id", :vcr do
      expect(GW2::Recipe.details(1275)).to eq(@recipe_details)
    end
  end
end
