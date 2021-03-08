class AddApprovedToBroker < ActiveRecord::Migration[6.1]
  def self.up
    add_column :brokers, :approved, :boolean, :default => false, :null => false
    add_index  :brokers, :approved
  end

  def self.down
    remove_index  :brokers, :approved
    remove_column :brokers, :approved
  end
  
end
