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
    @nft.update(gallery_id: params[:gallery_id])
    redirect_to edit_gallery_path(params[:gallery_id])
  end

  def remove_gala
    @nft = Nft.find(params[:id])
  end

  def confirm_gala
    @nft = Nft.find(params[:id])
    @nft.update(gallery_id: "")
  end
end
