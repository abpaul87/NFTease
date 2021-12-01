class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    if Gallery.where(user: current_user).empty?
      @gallery = Gallery.create(name: current_user.wallet, user: current_user)
    else
      @gallery = Gallery.where(user: current_user)
      @nfts = Nft.where(gallery: @gallery)
    end
  end

  def aboutus
  end
end
