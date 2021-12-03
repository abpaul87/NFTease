class NftsController < ApplicationController

  def show
    @nft = Nft.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    @base_url = request.base_url
    #@current_nft = Nft.find(params[:id])
    #@prev = @current_nft.previous
    #@next = @current_nft.next
  
    #respond_to do |format|
      #format.html
    #end
  end

  def edit
    @nft = Nft.find(params[:id])
  end

  def update
    @nft = Nft.find(params[:id])
    if @nft.gallery_id.nil?
      @nft.update(gallery_id: params[:gallery_id])
    else
      @nft.update(gallery_id: nil)
    end
    redirect_to edit_gallery_path(params[:gallery_id])
  end
end
