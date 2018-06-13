require "spec_helper"

describe GW2::Colors do
  describe ".colors" do
    before :each do
      @color = {
        "id" => 126,
        "item" => 20594,
        "name" => "Hot Pink",
        "base_rgb" => [128, 26, 26],
        "categories" => ["Red", "Vibrant", "Rare"],
        "cloth" => {
          "brightness" => 14,
          "contrast" => 1.21094,
          "hue" => 340,
          "saturation" => 0.820313,
          "lightness" => 1.44531,
          "rgb" => [169, 54, 94]
        },
        "leather" => {
          "brightness" => 14,
          "contrast" => 1.21094,
          "hue" => 340,
          "saturation" => 0.703125,
          "lightness" => 1.44531,
          "rgb" => [160, 62, 96]
        },
        "metal" => {
          "brightness" => 14,
          "contrast" => 1.21094,
          "hue" => 340,
          "saturation" => 0.585938,
          "lightness" => 1.44531,
          "rgb" => [151, 69, 98]
        }
      }
    end

    it "exists" do
      expect(GW2::Recipe.respond_to?(:all)).to eq(true)
    end

    it "returns all colors", :vcr do
      expect(GW2::Colors.details("126")).to eq(@color)
    end
  end
end
