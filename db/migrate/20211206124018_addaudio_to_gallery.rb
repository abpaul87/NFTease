class AddaudioToGallery < ActiveRecord::Migration[6.1]
  def change
    add_column :galleries, :playlist, :string
  end
end
