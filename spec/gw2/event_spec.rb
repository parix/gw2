require "spec_helper"

describe GW2::Event do
  describe ".all" do
    it "returns the correct JSON parsed data" do
      @events = [
        { "world_id" => 1013, "map_id" => 873, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537B", "state" => "Active" },
        { "world_id" => 1014, "map_id" => 874, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537C", "state" => "Success" },
        { "world_id" => 1015, "map_id" => 875, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537D", "state" => "Fail" },
        { "world_id" => 1016, "map_id" => 876, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537E", "state" => "Warmup" },
        { "world_id" => 1017, "map_id" => 877, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537F", "state" => "Preperation" }
      ]

      stub_request(:get, "https://api.guildwars2.com/v1/events.json").
        to_return(:status => 200, :body => { "events" => @events }.to_json)

      GW2::Event.all.should == { "events" => @events }
    end
  end

  describe ".events" do
    it "returns the correct JSON parsed data" do
      @events = [
        { "world_id" => 1013, "map_id" => 873, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537B", "state" => "Active" },
        { "world_id" => 1014, "map_id" => 874, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537C", "state" => "Success" },
        { "world_id" => 1015, "map_id" => 875, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537D", "state" => "Fail" },
        { "world_id" => 1016, "map_id" => 876, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537E", "state" => "Warmup" },
        { "world_id" => 1017, "map_id" => 877, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537F", "state" => "Preperation" }
      ]

      stub_request(:get, "https://api.guildwars2.com/v1/events.json?world_id=1014").
        to_return(:status => 200, :body => { "events" => @events.select{ |n| n[:world_id] == 1014 } }.to_json)
      stub_request(:get, "https://api.guildwars2.com/v1/events.json?map_id=875").
        to_return(:status => 200, :body => { "events" => @events.select{ |n| n[:map_id] == 875 } }.to_json)
      stub_request(:get, "https://api.guildwars2.com/v1/events.json?event_id=875").
        to_return(:status => 200, :body => { "events" =>  @events.select{ |n| n[:event_id] == "659149D4-43EC-4DCB-A6BB-0B2D402B537E" } }.to_json)

      GW2::Event.where(world_id: 1014).should == { "events" => @events.select{ |n| n[:world_id] == 1014 } }
    end
  end

  describe ".event_names" do
    it "returns the correct data" do
      @event_names = %Q([{"id":"7C2B9506-5C0C-49CA-9C73-3EA740772944","name":"Skill Challenge: Fight the Quaggan Pirate"}])

      stub_request(:get, "https://api.guildwars2.com/v1/event_names.json").
        to_return(:status => 200, :body => @event_names)

      GW2::Event.event_names.should == JSON.parse(@event_names)
    end
  end

  describe ".map_names" do
    it "returns the correct JSON parsed data" do
      @map_names = %Q([{"id":"15","name":"Queensdale"}])

      stub_request(:get, "https://api.guildwars2.com/v1/map_names.json").
        to_return(:status => 200, :body => @map_names)

      GW2::Event.map_names.should == JSON.parse(@map_names)
    end
  end

  describe ".world_names" do
    it "returns the correct JSON parsed data" do
      @world_names = %Q([{"id":"1004","name":"Henge of Denravi"}])

      stub_request(:get, "https://api.guildwars2.com/v1/world_names.json").
        to_return(:status => 200, :body => @world_names)

      GW2::Event.world_names.should == JSON.parse(@world_names)
    end
  end
end
