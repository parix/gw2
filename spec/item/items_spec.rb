require "spec_helper"

describe GW2API::Item do
  describe "methods" do
    context "#items" do
      before :each do
        @items = [12546, 12547, 12548, 12549, 12550]

        stub_request(:get, "https://api.guildwars2.com/v1/items.json").
          to_return(:status => 200, :body => { "items" => @items }.to_json)
      end

      it "exists" do
        GW2API::Item.respond_to?(:items).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2API::Item.items.should == { "items" => @items }
      end
    end
  end
end
