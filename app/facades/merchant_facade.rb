class MerchantFacade

  def self.all_merchants
    MerchantService.merchants[:data].map do |merchant|
      Merchant.new(merchant)
    end
  end

  def self.one_merchant(id)
    merchant = MerchantService.merchant(id)[:data]
    Merchant.new(merchant)
  end

  def self.all_merchant_items(id)
    MerchantService.merchant_items(id)[:data].map do |item|
      Item.new(item)
    end
  end
end