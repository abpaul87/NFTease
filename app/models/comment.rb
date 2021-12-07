class Comment < ApplicationRecord
    belongs_to :nft
    has_many :replies, class_name: 'Comment', foreign_key: :user_id , dependent: :destroy
    
    validates :body, presence: :true
end
