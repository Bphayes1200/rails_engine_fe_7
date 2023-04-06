require "rails_helper" 

RSpec.describe Merchant do 
  before :each do 
    json_data = File.read("spec/fixtures/merchant.json")
    stub_request(:get, "http://localhost:3000/api/v1/merchants/4")

    response = JSON.parse(json_data, symbolize_names: true)
    @merchant = Merchant.new(response[:data])
  end 

  it "will create a merchant object that has attributes" do 
    expect(@merchant.name).to eq("Cummings-Thiel")
  end
end