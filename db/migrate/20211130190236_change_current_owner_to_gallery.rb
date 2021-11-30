class ChangeCurrentOwnerToGallery < ActiveRecord::Migration[6.1]
  def change
    change_column(:nfts, :current_owner, :string)
  end
end
