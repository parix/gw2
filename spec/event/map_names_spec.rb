require "spec_helper"

describe GW2::Event do
  describe "methods" do
    context "#map_names" do
      before :each do
        @map_names = %Q([{"id":"15","name":"Queensdale"}])

        stub_request(:get, "https://api.guildwars2.com/v1/map_names.json").
          to_return(:status => 200, :body => @map_names)
      end

      it "exists" do
        GW2::Event.respond_to?(:map_names).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Event.map_names.should == JSON.parse(@map_names)
      end
    end
  end
end
