class LikesController < ApplicationController

  def like_toggle
    nft = Nft.find(params[:nft_id])
    current_like = Like.where(user_id: current_user).where(nft_id: nft.id)
    if current_like.empty?
      new_like = Like.create(user_id: current_user.id, nft_id: nft.id)
    else
      current_like[0].destroy
    end
  end
end
