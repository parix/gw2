require "spec_helper"

describe GW2::Dye do
  describe "methods" do
    context "#all" do
      before :each do
        @dyes = [668, 121, 377]

        stub_request(:get, "https://api.guildwars2.com/v1/colors.json").
          to_return(:status => 200, :body => { "colors" => @dyes }.to_json)
      end

      it "exists" do
        GW2::Dye.respond_to?(:all).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2::Dye.all.should == { "colors" => @dyes }
      end
    end
  end
end
