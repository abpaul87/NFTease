class Nft < ApplicationRecord
  belongs_to :user
  belongs_to :gallery, optional: true

  def previous
    Nft.where("gallery_id = ? AND id < ?", self.gallery.id, self.id).last
  end
  def next
    Nft.where("gallery_id = ? AND id > ?", self.gallery.id, self.id).first
  end
end
