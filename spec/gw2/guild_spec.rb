require "spec_helper"

describe GW2::Guild do
  describe ".details" do
    context "looking up details by guild ID" do
      let(:guild_id) { "16DB5921-CF1B-48D2-A5A0-2F0AADD9765D" }
      let(:endpoint) { "/guild_details.json?guild_id=#{guild_id}" }
      subject(:parsed_result) { GW2::Guild.details(guild_id: guild_id) }

      include_examples "an API response parser"
    end

    context "looking up details by guild name" do
      let(:guild_name) { "Ruinous" }
      let(:endpoint) { "/guild_details.json?guild_name=#{guild_name}" }
      subject(:parsed_result) { GW2::Guild.details(guild_name: guild_name) }

      include_examples "an API response parser"
    end
  end
end
