require "rails_helper"

RSpec.describe "MerchantService" do 
  before :each do 
    merchants = File.read("spec/fixtures/merchants.json")
    stub_request(:get, "http://localhost:3000/api/v1/merchants") 
      .to_return(status: 200, body: merchants)
  end
  
  it "returns merchants" do
    merchants = MerchantService.merchants
   
    expect(merchants[:data].first[:attributes][:name]).to eq("Schroeder-Jerde")
  end
end