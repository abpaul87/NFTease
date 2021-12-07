class CreateNfts < ActiveRecord::Migration[6.1]
  def change
    create_table :nfts do |t|
      t.integer :gallery_order
      t.integer :opensea_id
      t.string :token_name
      t.string :token_description
      t.string :collection_name
      t.string :collection_description
      t.string :artist_name
      t.string :image_url
      t.string :animation_url
      t.integer :current_owner
      t.json :token_metadata
      t.string :image_url_small
      t.string :opensea_link
      t.references :user, null: false, foreign_key: true
      t.references :gallery, null: true, foreign_key: true
      t.references :comments, null: true, foreign_key: true
      t.timestamps
    end
  end
end
