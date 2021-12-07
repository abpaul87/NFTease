class Nft < ApplicationRecord
  belongs_to :user
  belongs_to :gallery, optional: true
  has_many :likes

  # def previous
  #   Nft.where("gallery_id = ? AND id - ?", self.gallery.id, self.gallery_order)
  # end
  # def next
  #   Nft.where("gallery_id = ? AND id + ?", self.gallery.id, self.gallery_order)
  # end
end
