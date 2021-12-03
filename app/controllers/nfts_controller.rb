class NftsController < ApplicationController

  def show
    @nft = Nft.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
  end

  def edit
    @nft = Nft.find(params[:id])
  end

  def update
    @nft = Nft.find(params[:id])
    @nftes = Nft.where(gallery_id: params[:gallery_id])
    count = @nftes.length
    if @nft.gallery_id.nil?
      @nft.update(gallery_id: params[:gallery_id], gallery_order: count)
    else
      @nft.update(gallery_id: nil, gallery_order: nil)
    end
    redirect_to edit_gallery_path(params[:gallery_id])
  end
end
