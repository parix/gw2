require "spec_helper"

describe GW2::Misc do
  describe ".build" do
    let(:endpoint) { "/build.json" }
    subject(:parsed_result) { GW2::Misc.build }

    include_examples "an API response parser"
  end

  describe ".colors" do
    let(:endpoint) { "/colors.json" }
    subject(:parsed_result) { GW2::Misc.colors }

    include_examples "an API response parser"
  end

  describe ".files" do
    let(:endpoint) { "/files.json" }
    subject(:parsed_result) { GW2::Misc.files }

    include_examples "an API response parser"
  end
end
