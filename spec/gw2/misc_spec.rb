require "spec_helper"

describe GW2::Misc do
  describe ".build" do
    before :each do
      @build = 45662
    end

    it "exists" do
      expect(GW2::Misc.respond_to?(:build)).to eq(true)
    end

    it "returns the build", :vcr do
      expect(GW2::Misc.build).to eq(@build)
    end
  end

  describe ".files" do
    before :each do
      @file = { "file_id" => 528724, "signature" => "5A4E663071250EC72668C09E3C082E595A380BF7" }
    end

    it "exists" do
      expect(GW2::Misc.respond_to?(:files)).to eq(true)
    end

    it "returns all files", :vcr do
      expect(GW2::Misc.files["map_complete"]).to eq(@file)
    end
  end

  describe ".colors" do
    before :each do
      @color = {
        "name" => "Hot Pink",
        "base_rgb" => [ 128, 26, 26 ],
        "cloth" => {
          "brightness" => 14,
          "contrast" => 1.21094,
          "hue" => 340,
          "saturation" => 0.820313,
          "lightness" => 1.44531,
          "rgb" => [ 169, 54, 94 ]
        },
        "leather" => {
          "brightness" => 14,
          "contrast" => 1.21094,
          "hue" => 340,
          "saturation" => 0.703125,
          "lightness" => 1.44531,
          "rgb" => [ 160, 62, 96 ]
        },
        "metal" => {
          "brightness" => 14,
          "contrast" => 1.21094,
          "hue" => 340,
          "saturation" => 0.585938,
          "lightness" => 1.44531,
          "rgb" => [ 151, 69, 98 ]
        }
      }
    end

    it "exists" do
      expect(GW2::Misc.respond_to?(:colors)).to eq(true)
    end

    it "returns all colors", :vcr do
      expect(GW2::Misc.colors["126"]).to eq(@color)
    end
  end
end
