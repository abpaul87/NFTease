class AddWalletToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fieldname, :string
  end
end
