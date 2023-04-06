require "rails_helper" 
require "./app/facades/merchant_facade"

RSpec.describe MerchantFacade do 
  before :each do 
    merchants = File.read("spec/fixtures/merchants.json")
    stub_request(:get, "http://localhost:3000/api/v1/merchants") 
    .to_return(status: 200, body: merchants)
  end

  it "can return a merchant object and it's attributes" do 
   all_merchants = MerchantFacade.all_merchants

   expect(all_merchants.first.name).to eq("Schroeder-Jerde")
  end
end