class CreateBrokerStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :broker_stocks do |t|
      t.string :ticker
      t.string :company
      t.string :price
      t.timestamps
    end
  end
end
