require "spec_helper"

describe GW2::Item do
  describe "methods" do
    context "#all" do
      before :each do
        @items = [12546, 12547, 12548, 12549, 12550]

        stub_request(:get, "https://api.guildwars2.com/v1/items.json").
          to_return(:status => 200, :body => { "items" => @items }.to_json)
      end

      it "exists" do
        GW2::Item.respond_to?(:all).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Item.all.should == { "items" => @items }
      end
    end
  end
end
