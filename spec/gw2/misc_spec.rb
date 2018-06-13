require "spec_helper"

describe GW2::Misc do
  describe ".build" do
    before :each do
      @build = 89447
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
      @file = {"id"=>"map_complete", "icon"=>"https://render.guildwars2.com/file/5A4E663071250EC72668C09E3C082E595A380BF7/528724.png"}
    end

    it "exists" do
      expect(GW2::Misc.respond_to?(:files)).to eq(true)
    end

    it "returns all files", :vcr do
      expect(GW2::Misc.files[0]).to eq(@file)
    end
  end
end
