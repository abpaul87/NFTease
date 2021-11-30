class AddWalletToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wallet, :string
  end
end
