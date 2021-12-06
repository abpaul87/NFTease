class NftsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @nft = Nft.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    order = Nft.where(gallery: @gallery).order(:gallery_order)
    @length = order.length
    current = 0
    prev = 0
    net = 0
    array = []
    order.each do |item|
      array << item
    end
    array.each_with_index do |element, index|
      if element.gallery_order == @nft.gallery_order
        current = index
        less = index - 1
        more = index + 1
        if @length > 1
          if index.zero?
            net = array[more]
          elsif index == @length - 1
            prev = array[less]
          else
            net = array[more]
            prev = array[less]
          end
        end
      end
    end
    @did = prev
    @done = net
    @finito = current
    # array = []
    # @nft_order = Nft.where(gallery_id: params[:gallery_id]).each do |item|
    #   array << item.gallery_order
    # end
    # new_array = array.sort
    # current_nft = new_array.find(@nft.gallery_order)
    # @prev = Nft.where(gallery_order: current_nft - 1)
    # @net = Nft.find(gallery_order: current_nft + 1)
    # raise
    @base_url = request.base_url
    # new_array.each_with_index do |element, index|

    # end

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
