require "spec_helper"

describe GW2::Recipe do
  describe "methods" do
    context "#details" do
      before :each do
        @recipe_details = {
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

        stub_request(:get, "https://api.guildwars2.com/v1/recipe_details.json?recipe_id=1275").
          to_return(:status => 200, :body => @recipe_details.to_json)
      end

      it "exists" do
        GW2::Recipe.respond_to?(:details).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Recipe.details(1275).should == @recipe_details
      end
    end
  end
end
