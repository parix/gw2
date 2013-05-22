require "spec_helper"

describe GW2API::WvW do
  describe "methods" do
    context "#match_details" do
      before :each do
        @match_details = {
          "match_id" => "2-3",
          "scores" => [155221,151605,162092],
          "maps" => [
            { "type" => "RedHome",
              "scores" => [59573,23796,18316],
              "objectives" => [
                {"id" => 32,"owner" => "Blue"},
                {"id" => 33,"owner" => "Blue"},
                {"id" => 34,"owner" => "Blue"},
                {"id" => 35,"owner" => "Blue"},
                {"id" => 36,"owner" => "Blue"},
                {"id" => 37,"owner" => "Blue","owner_guild" => "199C1F0E-AD62-4FF4-BE56-1189FFB8A89A"},
                {"id" => 38,"owner" => "Red"},
                {"id" => 39,"owner" => "Blue"},
                {"id" => 40,"owner" => "Blue"},
                {"id" => 50,"owner" => "Blue","owner_guild" => "E5E16465-4CB5-494A-8990-B893C46B527E"},
                {"id" => 51,"owner" => "Blue"},
                {"id" => 52,"owner" => "Red"},
                {"id" => 53,"owner" => "Blue"}
              ]
            },
            { "type" => "GreenHome",
              "scores" => [20680,26330,52579],
              "objectives" => [
                {"id" => 41,"owner" => "Blue"},
                {"id" => 42,"owner" => "Blue"},
                {"id" => 43,"owner" => "Blue"},
                {"id" => 44,"owner" => "Blue","owner_guild" => "6E884D81-3E34-46EE-85A1-91BE902D5522"},
                {"id" => 45,"owner" => "Blue","owner_guild" => "ABBD0F2A-DD9F-4496-9AD2-CFBB9958DA11"},
                {"id" => 46,"owner" => "Blue","owner_guild" => "3BADBA61-A0FC-47A8-8558-26591049C9CD"},
                {"id" => 47,"owner" => "Green","owner_guild" => "7FE25AEC-96B8-46A9-88B1-9B99ABF42F40"},
                {"id" => 48,"owner" => "Blue"},
                {"id" => 49,"owner" => "Blue","owner_guild" => "F7BE2E79-87F6-441A-96AC-F66075668102"},
                {"id" => 54,"owner" => "Red"},
                {"id" => 55,"owner" => "Red"},
                {"id" => 56,"owner" => "Blue"},
                {"id" => 57,"owner" => "Blue"}
              ]
            },
            { "type" => "BlueHome",
              "scores" => [27092,55872,17878],
              "objectives" => [
                {"id" => 23,"owner" => "Blue"},
                {"id" => 24,"owner" => "Red"},
                {"id" => 25,"owner" => "Blue"},
                {"id" => 26,"owner" => "Blue"},
                {"id" => 27,"owner" => "Blue"},
                {"id" => 28,"owner" => "Blue"},
                {"id" => 29,"owner" => "Blue","owner_guild" => "AEA6CFB4-9378-4548-831E-01110EFB1619"},
                {"id" => 30,"owner" => "Blue"},
                {"id" => 31,"owner" => "Blue"},
                {"id" => 58,"owner" => "Blue"},
                {"id" => 59,"owner" => "Blue"},
                {"id" => 60,"owner" => "Red"},
                {"id" => 61,"owner" => "Red"}
              ]
            },
            { "type" => "Center",
              "scores" => [47876,45607,73319],
              "objectives" => [
                {"id" => 1,"owner" => "Red","owner_guild" => "0E59E334-5F87-46A5-8CC8-6953AE5FC16A"},
                {"id" => 2,"owner" => "Blue","owner_guild" => "F36CC3FE-4F8B-486B-B5E1-D725119505F8"},
                {"id" => 3,"owner" => "Green","owner_guild" => "634BB549-B013-44BF-8915-2075DCA94062"},
                {"id" => 4,"owner" => "Green"},
                {"id" => 5,"owner" => "Blue"},
                {"id" => 6,"owner" => "Red"},
                {"id" => 7,"owner" => "Green","owner_guild" => "CF02A8AE-EC30-4377-9897-CC8EEC12050B"},
                {"id" => 8,"owner" => "Blue"},
                {"id" => 9,"owner" => "Blue","owner_guild" => "61B7040B-C243-4BB5-934C-C60AF0AD9FAE"},
                {"id" => 10,"owner" => "Green"},
                {"id" => 11,"owner" => "Green","owner_guild" => "390ABFA1-BB45-47F1-BBF9-EA4213FD8F76"},
                {"id" => 12,"owner" => "Green","owner_guild" => "C4D66309-DB0B-4CE1-A97E-B0C587C65994"},
                {"id" => 13,"owner" => "Green","owner_guild" => "71F44932-2DAA-4406-A705-AC4C557E57D1"},
                {"id" => 14,"owner" => "Green","owner_guild" => "D4BDDB21-CCB4-4838-94B8-170457AAB623"},
                {"id" => 15,"owner" => "Blue","owner_guild" => "7847823D-FB01-43FF-A7C2-DC0F0D12D4E7"},
                {"id" => 16,"owner" => "Blue","owner_guild" => "D12DB7AD-01FD-41F2-AE08-19A92AA05F6D"},
                {"id" => 17,"owner" => "Red"},
                {"id" => 18,"owner" => "Blue"},
                {"id" => 19,"owner" => "Red","owner_guild" => "EDA9DED3-8FA9-4B29-8787-06ED031238AA"},
                {"id" => 20,"owner" => "Red","owner_guild" => "75DC0FD9-7134-41E5-BBDA-6E620DF364B2"},
                {"id" => 21,"owner" => "Blue"},
                {"id" => 22,"owner" => "Blue","owner_guild" => "77A3A76E-A852-45FE-BA23-3A1F7847E8AC"}
              ]
            }
          ]
        }

        stub_request(:get, "https://api.guildwars2.com/v1/wvw/match_details.json?match_id=2-3").
          to_return(:status => 200, :body => @match_details.to_json)
      end

      it "exists" do
        GW2API::WvW.respond_to?(:match_details).should == true
      end
  
      it "returns the correct JSON parsed data" do
        GW2API::WvW.match_details("2-3").should == @match_details
      end
    end
  end
end
