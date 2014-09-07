require "spec_helper"

describe GW2::Recipe do
  describe ".all" do
    it "returns the correct JSON parsed data" do
      recipes = [1275, 1276, 1277, 1278, 1279]

      response_body = { "recipes" => recipes }.to_json
      stub_endpoint("/recipes.json").to_return(body: response_body)

      GW2::Recipe.all.should == { "recipes" => recipes }
    end
  end

  describe ".details" do
    it "returns the correct JSON parsed data" do
      recipe_details = {
        "recipe_id" => "1275",
        "type" => "Coat",
        "output_item_id" => "11541",
        "output_item_count" => "1",
        "min_rating" => "25",
        "time_to_craft_ms" => "1000",
        "ingredients" => [
          {"item_id" => "19797","count" => "1"},
          {"item_id" => "13094","count" => "1"},
          {"item_id" => "13093","count" => "1"}
        ]
      }

      stub_endpoint("/recipe_details.json?recipe_id=1275").
        to_return(body: recipe_details.to_json)

      GW2::Recipe.details(1275).should == recipe_details
    end
  end
end
