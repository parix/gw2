shared_examples "an API response parser" do
  let(:response_body) { sample_data.to_json }

  let(:sample_data) do
    [
      { "string" => "foo", "integer" => 42, "array" => ["foo", 42], "hash" => { "foo" => 42 } },
      { "string" => "bar", "integer" => 97, "array" => ["bar", 97], "hash" => { "bar" => 97 } },
    ]
  end

  it "returns the correct JSON parsed data" do
    stub_endpoint(endpoint).to_return(body: response_body)
    parsed_result.should == sample_data
  end
end
