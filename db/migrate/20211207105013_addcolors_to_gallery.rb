class AddcolorsToGallery < ActiveRecord::Migration[6.1]
  def change
    add_column :galleries, :colors, :string
  end
end
