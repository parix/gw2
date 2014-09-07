require "spec_helper"

describe GW2::Misc do
  describe ".build" do
    it "returns the correct JSON parsed data" do
      build = { "build_id" => 22120 }
      stub_endpoint("/build.json").to_return(body: build.to_json)

      GW2::Misc.build.should == build
    end
  end

  describe ".colors" do
    it "returns the correct JSON parsed data" do
      colors = {
        "126" => {
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
      }

      response_body = { "colors" => colors }.to_json
      stub_endpoint("/colors.json").to_return(body: response_body)

      GW2::Misc.colors.should == { "colors" => colors }
    end
  end

  describe ".files" do
    it "returns the correct JSON parsed data" do
      files = {
        "map_complete" => { "file_id" => 528724, "signature" => "5A4E663071250EC72668C09E3C082E595A380BF7" },
        "map_dungeon" => { "file_id" => 102478, "signature" => "943538394A94A491C8632FBEF6203C2013443555" },
        "map_heart_empty" => { "file_id" => 102440, "signature" => "09ACBA53B7412CC3C76E7FEF39929843C20CB0E4" }
      }

      stub_endpoint("/files.json").to_return(body: files.to_json)

      GW2::Misc.files.should == files
    end
  end
end
