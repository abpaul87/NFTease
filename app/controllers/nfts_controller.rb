class NftsController < ApplicationController

  def show
    @nft = Nft.find(params[:id])
    @gallery = Gallery.where(params[:gallery_id])
  end

  def edit
    @nft = Nft.find(params[:id])
  end

  def update
    @nft = Nft.find(params[:id])
    if @nft.update(gallery_id: params[:gallery_id])
      redirect_to gallery_path(params[:gallery_id])
    else
      render :edit
    end
  end
end
