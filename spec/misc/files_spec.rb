require "spec_helper"

describe GW2::Misc do
  describe "methods" do
    context "#files" do
      before :each do
        @files = {
          "map_complete" => { "file_id" => 528724, "signature" => "5A4E663071250EC72668C09E3C082E595A380BF7" },
          "map_dungeon" => { "file_id" => 102478, "signature" => "943538394A94A491C8632FBEF6203C2013443555" },
          "map_heart_empty" => { "file_id" => 102440, "signature" => "09ACBA53B7412CC3C76E7FEF39929843C20CB0E4" }
        }

        stub_request(:get, "https://api.guildwars2.com/v1/files.json").
          to_return(:status => 200, :body => @files.to_json)
      end

      it "exists" do
        GW2::Misc.respond_to?(:files).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2::Misc.files.should == @files
      end
    end
  end
end