class MerchantService
  def self.merchants
    JSON.parse(conn.get("merchants").body, symbolize_names: true)
  end

  def self.merchant(id)
    JSON.parse(conn.get("merchants/#{id}").body, symbolize_names: true)
  end

  def self.merchant_items(id)
    JSON.parse(conn.get("merchants/#{id}/items").body, symbolize_names: true)
  end

  private
    def self.conn
      Faraday.new(url: "http://localhost:3000/api/v1/")
    end 
end