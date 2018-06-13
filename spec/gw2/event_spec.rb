require "spec_helper"

describe GW2::Event do
  describe ".event_names" do
    before :each do
      @event = { "id" => "7C2B9506-5C0C-49CA-9C73-3EA740772944",
                 "name" => "Skill Challenge: Fight the Quaggan Pirate" }
    end

    it "exists" do
      expect(GW2::Event.respond_to?(:event_names)).to eq(true)
    end

    it "returns the names of all events", :vcr do
      expect { GW2::Event.event_names }.to raise_error(GW2::Disabled)
    end
  end

  describe ".world_names" do
    before :each do
      @world = { "id" => "1004", "name" => "Henge of Denravi" }
    end

    it "exists" do
      expect(GW2::Event.respond_to?(:world_names)).to eq(true)
    end

    it "returns the names of all worlds", :vcr do
      expect(GW2::Event.world_names).to include(@world)
    end
  end


  describe ".all" do
    it "exists" do
      expect(GW2::Event.respond_to?(:all)).to eq(true)
    end

    it "is currently disabled" do
      expect { GW2::Event.all }.to raise_error(GW2::Disabled)
    end
  end

  describe ".where" do
    it "exists" do
      expect(GW2::Event.respond_to?(:where)).to eq(true)
    end

    it "is currently disabled" do
      expect { GW2::Event.where(world_id: 1014) }.to raise_error(GW2::Disabled)
    end
  end
end
