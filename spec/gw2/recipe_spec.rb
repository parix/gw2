require "spec_helper"

describe GW2::Recipe do
  describe ".all" do
    let(:endpoint) { "/recipes.json" }
    subject(:parsed_result) { GW2::Recipe.all }

    include_examples "an API response parser"
  end

  describe ".details" do
    let(:endpoint) { "/recipe_details.json?recipe_id=1275" }
    subject(:parsed_result) { GW2::Recipe.details(1275) }

    include_examples "an API response parser"
  end
end
