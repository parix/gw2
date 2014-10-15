shared_examples "an API response parser" do
  let(:response_body) { sample_data.to_json }

  let(:sample_data) do
    [
      { "String" => "By Ogden's Hammer, What Savings!" },
      { "Integer" => 42 },
      { "Array" => ["Chauncy von Snuffles III", 9001] },
      { "Hash" => { "Chauncy von Snuffles III" => 9001 } },
    ]
  end

  it "returns the correct JSON parsed data" do
    stub_endpoint(endpoint).to_return(body: response_body)
    parsed_result.should == sample_data
  end
end
