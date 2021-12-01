class AddNullTrueToGalleryOrder < ActiveRecord::Migration[6.1]
  def change
    change_column(:nfts, :gallery_order, :integer, null: true)
  end
end
