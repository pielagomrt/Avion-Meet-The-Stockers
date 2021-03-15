class CreateBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :buyer_stocks do |t|
      t.integer :broker_stock_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end
