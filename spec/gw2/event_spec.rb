require "spec_helper"

describe GW2::Event do
  describe ".all" do
    let(:endpoint) { "/events.json" }
    subject(:parsed_result) { GW2::Event.all }

    include_examples "an API response parser"
  end

  describe ".where" do
    context "filtering by a world ID" do
      let(:endpoint) { "/events.json?world_id=1014" }
      subject(:parsed_result) { GW2::Event.where(world_id: 1014) }

      include_examples "an API response parser"
    end

    context "filtering by a map ID" do
      let(:endpoint) { "/events.json?map_id=875" }
      subject(:parsed_result) { GW2::Event.where(map_id: 875) }

      include_examples "an API response parser"
    end

    context "filtering by an event ID" do
      let(:event_id) { "659149D4-43EC-4DCB-A6BB-0B2D402B537E" }
      let(:endpoint) { "/events.json?event_id=#{event_id}" }
      subject(:parsed_result) { GW2::Event.where(event_id: event_id) }

      include_examples "an API response parser"
    end
  end

  describe ".event_names" do
    let(:endpoint) { "/event_names.json" }
    subject(:parsed_result) { GW2::Event.event_names }

    include_examples "an API response parser"
  end

  describe ".map_names" do
    let(:endpoint) { "/map_names.json" }
    subject(:parsed_result) { GW2::Event.map_names }

    include_examples "an API response parser"
  end

  describe ".world_names" do
    let(:endpoint) { "/world_names.json" }
    subject(:parsed_result) { GW2::Event.world_names }

    include_examples "an API response parser"
  end
end
