require "spec_helper"

describe GW2::Quaggans do
  describe ".all" do
    before :each do
      @quaggans = ["box", "breakfast"]
    end

    it "exists" do
      expect(GW2::Quaggans.respond_to?(:all)).to eq(true)
    end

    it "returns all Quaggans", :vcr do
      expect(GW2::Quaggans.all).to include(*@quaggans)
    end
  end

  describe ".details" do
    before :each do
      @quaggan_details = {"id"=>"box", "url"=>"https://static.staticwars.com/quaggans/box.jpg"}
    end

    it "exists" do
      expect(GW2::Quaggans.respond_to?(:details)).to eq(true)
    end

    it "returns the details of the quaggan", :vcr do
      expect(GW2::Quaggans.details("box")).to eq(@quaggan_details)
    end
  end
end
