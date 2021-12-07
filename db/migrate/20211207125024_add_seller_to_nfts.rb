class AddSellerToNfts < ActiveRecord::Migration[6.1]
  def change
    add_column :nfts, :forsale, :boolean
  end
end
