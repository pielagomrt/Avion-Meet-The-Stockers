class AddFirstNameAndLastNameToBrokers < ActiveRecord::Migration[6.1]
  def change
    add_column :brokers, :first_name, :string
    add_column :brokers, :last_name, :string
  end
end
