require "spec_helper"

describe GW2::WvW do
  describe ".objective_names" do
    before :each do
      @objective_names = [
        {"id"=>"38-21", "name"=>"Durios Gulch"},
        {"id"=>"38-20", "name"=>"Veloka Slope"}
      ]
    end

    it "exists" do
      expect(GW2::WvW.respond_to?(:objective_names)).to eq(true)
    end

    it "returns all objectives", :vcr do
      expect(GW2::WvW.objective_names).to include(*@objective_names)
    end
  end

  describe ".matches" do
    before :each do
      @match = {
        "wvw_match_id" => "1-1",
        "red_world_id" => 1019,
        "blue_world_id" => 1016,
        "green_world_id" => 1008,
        "start_time" => "2018-06-09T02:00:00Z",
        "end_time" => "2018-06-16T01:58:00Z"
      }
    end

    it "exists" do
      expect(GW2::WvW.respond_to?(:matches)).to eq(true)
    end

    it "returns all matches", :vcr do
      expect(GW2::WvW.matches).to include(@match)
    end
  end

  describe ".match_details" do
    before :each do
      @scores = [169318, 126722, 126046]
    end

    it "exists" do
      expect(GW2::WvW.respond_to?(:match_details)).to eq(true)
    end

    it "returns the details of a match", :vcr do
      expect(GW2::WvW.match_details("2-3")[0]["scores"]).to eq(@scores)
    end
  end
end
