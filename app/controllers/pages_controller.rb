class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home aboutus]

  def home
    @galleries = Gallery.all
  end

  def dashboard
    if Gallery.where(user: current_user).empty?
      @gallery = Gallery.create(name: current_user.wallet, user: current_user)
    else
      @gallery = Gallery.find_by(user: current_user)
      @nfts = Nft.where(gallery: @gallery).order(gallery_order: :asc)
    end
  end

  def aboutus
  end
end
