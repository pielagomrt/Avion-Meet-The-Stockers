class AddQuantityToBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :buyer_stocks, :quantity, :integer 
  end
end
