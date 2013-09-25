require "spec_helper"

describe GW2::Build do
  describe "methods" do
    context "#current" do
      before :each do
        @build = { "build_id" => 22120 }

        stub_request(:get, "https://api.guildwars2.com/v1/build.json").
          to_return(:status => 200, :body => @build.to_json)
      end

      it "exists" do
        GW2::Build.respond_to?(:current).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2::Build.current.should == @build
      end
    end
  end
end
