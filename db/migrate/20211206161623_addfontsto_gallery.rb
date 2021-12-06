class AddfontstoGallery < ActiveRecord::Migration[6.1]
  def change
    add_column :galleries, :fonts, :string
  end
end
