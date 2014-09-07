require "spec_helper"

describe GW2::Item do
  describe ".all" do
    let(:endpoint) { "/items.json" }
    subject(:parsed_result) { GW2::Item.all }

    include_examples "an API response parser"
  end

  describe ".details" do
    let(:endpoint) { "/item_details.json?item_id=12546" }
    subject(:parsed_result) { GW2::Item.details(12546) }

    include_examples "an API response parser"
  end
end
