class GalleriesController < ApplicationController
  OPENSEA_ASSET_URL = "https://api.opensea.io/api/v1/assets?format=json&limit=50&offset=0&order_direction=asc&owner="
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
    @nfts = Nft.where(gallery: @gallery).order(:gallery_order)
  end

  # def new
  #   @gallery = Gallery.new()
  #   # @nfts = Nft.where(user: current_user).where(current_owner: current_user.wallet)
  # end

  # def create
  #   @gallery = Gallery.new(gallery_params)
  #   @gallery.user_id = current_user.id
  #   # authorize @gallery
  #   if @gallery.save
  #     redirect_to gallery_path(@gallery)
  #   else
  #     render :new
  #   end
  # end

  def update_order
    ordered_ids = params[:order].split(',')

    updates = ordered_ids.map.with_index do |id, index|
      { gallery_order: index }
    end

    current_user.nfts.update(ordered_ids, updates)
  end

  def edit
    @gallery = Gallery.find(params[:id])
    opensea_pull
    @nfts_added = current_user.nfts.where(gallery: @gallery).order(gallery_order: :asc)
    @nfts_available = current_user.nfts.where(gallery: nil)
    @length = @nfts_available.length
    current = {}
    array = []
    @nfts_available.each do |item|
      array << item
    end
    array.each_with_index do |element, index|
      net = 0
      if index == @length - 1
        net = index - 1
      else
        net = index + 1
      end
      current[element] = { current: index, other: net }
    end
    @finito = current
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update(gallery_params)
    # authorize @gallery
    if @gallery.update(gallery_params)
      redirect_to edit_gallery_path(@gallery)
    else
      render :edit
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :fonts, :playlist, :colors)
  end

  def opensea_pull
    url = URI(OPENSEA_ASSET_URL + current_user.wallet)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::get(url)
    response = JSON.parse(request)
    response['assets'].each do |asset|
      sale = 0
      if asset['sell_orders'].nil?
        sale = false
      else
        sale = true
      end
      if Nft.where(user: current_user).where(opensea_id: asset['id']).empty?
        nft = Nft.create(
          opensea_id: asset['id'],
          token_name: asset['name'],
          token_description: asset['description'],
          collection_name: asset.dig('collection', 'name'),
          collection_description: asset.dig('collection', 'description'),
          artist_name: asset.dig('creator', 'user', 'username') || asset.dig('collection', 'name'),
          image_url: asset['image_url'] || "https://res.cloudinary.com/jansommer/image/upload/v1638530952/nftease/no-image.png",
          animation_url: asset['animation_original_url'],
          current_owner: asset.dig('owner', 'address'),
          token_metadata: asset,
          image_url_small: asset['image_preview_url'] || "https://res.cloudinary.com/jansommer/image/upload/v1638530952/nftease/no-image.png",
          opensea_link: asset['permalink'],
          user: current_user,
          forsale: sale
        )
        nft.save
      else
        nft = Nft.find_by(user: current_user, opensea_id: asset['id'])
        nft.update(current_owner: asset.dig('owner', 'address'), token_metadata: asset, forsale: sale)
      end
    end
  end
end
