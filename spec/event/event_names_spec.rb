require "spec_helper"

describe GW2::Event do
  describe "methods" do
    context "#event_names" do
      before :each do
        @event_names = %Q([{"id":"7C2B9506-5C0C-49CA-9C73-3EA740772944","name":"Skill Challenge: Fight the Quaggan Pirate"}])

        stub_request(:get, "https://api.guildwars2.com/v1/event_names.json").
          to_return(:status => 200, :body => @event_names)
      end

      it "exists" do
        GW2::Event.respond_to?(:event_names).should == true
      end

      it "returns the correct data" do
        GW2::Event.event_names.should == JSON.parse(@event_names)
      end
    end
  end
end
