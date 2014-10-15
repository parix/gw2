require "spec_helper"

describe GW2::WvW do
  describe ".matches" do
    let(:endpoint) { "/wvw/matches.json" }
    subject(:parsed_result) { GW2::WvW.matches }

    include_examples "an API response parser"
  end

  describe ".match_details" do
    let(:endpoint) {"/wvw/match_details.json?match_id=2-3"}
    subject(:parsed_result) { GW2::WvW.match_details("2-3") }

    include_examples "an API response parser"
  end

  describe ".objective_names" do
    let(:endpoint) { "/wvw/objective_names.json" }
    subject(:parsed_result) { GW2::WvW.objective_names }

    include_examples "an API response parser"
  end
end
