require "spec_helper"

describe GW2API::Event do
  describe "methods" do
    context "#events" do
      before :each do
        @events = [
          { "world_id" => 1013, "map_id" => 873, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537B", "state" => "Active" },
          { "world_id" => 1014, "map_id" => 874, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537C", "state" => "Success" },
          { "world_id" => 1015, "map_id" => 875, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537D", "state" => "Fail" },
          { "world_id" => 1016, "map_id" => 876, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537E", "state" => "Warmup" },
          { "world_id" => 1017, "map_id" => 877, "event_id" => "659149D4-43EC-4DCB-A6BB-0B2D402B537F", "state" => "Preperation" }
        ]

        stub_request(:get, "https://api.guildwars2.com/v1/events.json").
          to_return(:status => 200, :body => { "events" => @events }.to_json)
        stub_request(:get, "https://api.guildwars2.com/v1/events.json?world_id=1014").
          to_return(:status => 200, :body => { "events" => @events.select{ |n| n[:world_id] == 1014 } }.to_json)
        stub_request(:get, "https://api.guildwars2.com/v1/events.json?map_id=875").
          to_return(:status => 200, :body => { "events" => @events.select{ |n| n[:map_id] == 875 } }.to_json)
        stub_request(:get, "https://api.guildwars2.com/v1/events.json?event_id=875").
          to_return(:status => 200, :body => { "events" =>  @events.select{ |n| n[:event_id] == "659149D4-43EC-4DCB-A6BB-0B2D402B537E" } }.to_json)
      end

      it "exists" do
        GW2API::Event.respond_to?(:events).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2API::Event.events(world_id: 1014).should == { "events" => @events.select{ |n| n[:world_id] == 1014 } }
      end
    end
  end
end
