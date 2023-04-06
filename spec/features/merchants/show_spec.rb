require "rails_helper"

RSpec.describe "Merchant Show Page" do 
  before :each do 
    merchant_response = File.read("spec/fixtures/merchant.json")
    stub_request(:get, "http://localhost:3000/api/v1/merchants/4")
    .to_return(status: 200, body: merchant_response)
    
   @merchant = JSON.parse((merchant_response), symbolize_names: true)

   item_response = File.read("spec/fixtures/merchant_items.json")
   stub_request(:get, "http://localhost:3000/api/v1/merchants/4/items")
   .to_return(status: 200, body: item_response)
  
   @items = JSON.parse((item_response), symbolize_names: true)

  visit "/merchants/#{@merchant[:data][:id]}"
  end

  it "will have the merchant name and all of the items the merchant sells" do 
    expect(page).to have_content(@merchant[:data][:attributes][:name])
    
    @items[:data].each do |item|
      expect(page).to have_content(item[:attributes][:name])
      expect(page).to have_content(item[:attributes][:description])
      expect(page).to have_content(item[:attributes][:unit_price])
    end 
  end
end
