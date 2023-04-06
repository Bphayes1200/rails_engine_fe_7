require "rails_helper"

RSpec.describe "Merchants Index page" do 
  before :each do 
    @merchants = File.read("spec/fixtures/merchants.json")
    stub_request(:get, "http://localhost:3000/api/v1/merchants")
      .to_return(status: 200, body: @merchants)

    @all_merchants = JSON.parse((@merchants), symbolize_names: true)
    visit "/merchants"
  end

  it "will have a list of merchants" do 
    @all_merchants[:data].each do |merchant|
      expect(page).to have_content(merchant[:attributes][:name])
      expect(page).to have_link(merchant[:attributes][:name])
    end
  end

  
end