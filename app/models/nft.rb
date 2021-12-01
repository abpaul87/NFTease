class Nft < ApplicationRecord
  belongs_to :user
  belongs_to :gallery, optional: true
end
