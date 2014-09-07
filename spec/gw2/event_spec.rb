require "spec_helper"

describe GW2::Event do
  let(:events) do
    Events.new(
      [
        { "world_id" => 1013, "map_id" => 873, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537B", "state" => "Active" },
        { "world_id" => 1014, "map_id" => 874, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537C", "state" => "Success" },
        { "world_id" => 1015, "map_id" => 875, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537D", "state" => "Fail" },
        { "world_id" => 1016, "map_id" => 876, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537E", "state" => "Warmup" },
        { "world_id" => 1017, "map_id" => 877, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537F", "state" => "Preperation" }
      ]
    )
  end

  describe ".all" do
    it "returns the correct JSON parsed data" do
      stub_endpoint("/events.json").to_return(body: events.to_json)

      GW2::Event.all.should == { "events" => events.to_a }
    end
  end

  describe ".where" do
    it "returns a list of events for a world ID" do
      results = events.where(world_id: 1014)
      stub_endpoint("/events.json?world_id=1014").to_return(body: results.to_json)

      GW2::Event.where(world_id: 1014).should == { "events" => results.events }
    end

    it "returns a list of events for a map ID" do
      results = events.where(map_id: 875)
      stub_endpoint("/events.json?map_id=875").to_return(body: results.to_json)

      GW2::Event.where(map_id: 875).should == { "events" => results.events }
    end

    it "returns a list of events for an event ID" do
      event_id = "659149D4-43EC-4DCB-A6BB-0B2D402B537E"
      results = events.where(event_id: event_id)
      stub_endpoint("/events.json?event_id=#{event_id}").to_return(body: results.to_json)

      GW2::Event.where(event_id: event_id).should == { "events" => results.events }
    end
  end

  describe ".event_names" do
    it "returns the correct JSON parsed data" do
      event_names = %Q([{"id":"7C2B9506-5C0C-49CA-9C73-3EA740772944","name":"Skill Challenge: Fight the Quaggan Pirate"}])
      stub_endpoint("/event_names.json").to_return(body: event_names)

      GW2::Event.event_names.should == JSON.parse(event_names)
    end
  end

  describe ".map_names" do
    it "returns the correct JSON parsed data" do
      map_names = %Q([{"id":"15","name":"Queensdale"}])
      stub_endpoint("/map_names.json").to_return(body: map_names)

      GW2::Event.map_names.should == JSON.parse(map_names)
    end
  end

  describe ".world_names" do
    it "returns the correct JSON parsed data" do
      world_names = %Q([{"id":"1004","name":"Henge of Denravi"}])
      stub_endpoint("/world_names.json").to_return(body: world_names)

      GW2::Event.world_names.should == JSON.parse(world_names)
    end
  end

  Events = Struct.new(:events) do
    def to_a
      events
    end

    def to_json
      { "events" => events }.to_json
    end

    def where(query)
      key, value = query.first
      results = events.select { |e| e[key.to_s] == value }
      Events.new(results)
    end
  end
end
