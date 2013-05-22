require "spec_helper"

describe GW2API::Event do
  describe "methods" do
    context "#world_names" do
      before :each do
        @world_names = %Q([{"id":"1004","name":"Henge of Denravi"}])

        stub_request(:get, "https://api.guildwars2.com/v1/world_names.json").
          to_return(:status => 200, :body => @world_names)
      end

      it "exists" do
        GW2API::Event.respond_to?(:world_names).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2API::Event.world_names.should == JSON.parse(@world_names)
      end
    end
  end
end
