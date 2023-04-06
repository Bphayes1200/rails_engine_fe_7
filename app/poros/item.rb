class Item
  attr_reader :name,
              :description,
              :unit_price, 
              :merchant_id

  def initialize(response)
    # require 'pry'; binding.pry
    @name = response[:attributes][:name]
    @description = response[:attributes][:description]
    @unit_price = response[:attributes][:unit_price]
    @merchant_id = response[:attributes][:merchant_id]
  end
end