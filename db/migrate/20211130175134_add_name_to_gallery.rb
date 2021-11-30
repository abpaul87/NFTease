class AddNameToGallery < ActiveRecord::Migration[6.1]
  def change
    add_column :galleries, :name, :string
  end
end
