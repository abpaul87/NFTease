class Gallery < ApplicationRecord
  belongs_to :user
  has_many :nfts

  has_one_attached :playlist

end
