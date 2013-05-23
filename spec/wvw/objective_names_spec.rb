require "spec_helper"

describe GW2::WvW do
  describe "methods" do
    context "#objective_names" do
      before :each do
        @objective_names = [
          {"id" => "30","name" => "Tower"},
          {"id" => "57","name" => "Tower"}
        ]

        stub_request(:get, "https://api.guildwars2.com/v1/wvw/objective_names.json").
          to_return(:status => 200, :body => @objective_names.to_json)
      end

      it "exists" do
        GW2::WvW.respond_to?(:objective_names).should == true
      end

      it "returns the correct data" do
        GW2::WvW.objective_names.should == @objective_names
      end
    end
  end
end
