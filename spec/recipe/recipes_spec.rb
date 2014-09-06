require "spec_helper"

describe GW2::Recipe do
  describe "methods" do
    context "#all" do
      before :each do
        @recipes = [1275, 1276, 1277, 1278, 1279]

        stub_request(:get, "https://api.guildwars2.com/v1/recipes.json").
          to_return(:status => 200, :body => { "recipes" => @recipes }.to_json)
      end

      it "exists" do
        GW2::Recipe.respond_to?(:all).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Recipe.all.should == { "recipes" => @recipes }
      end
    end
  end
end
