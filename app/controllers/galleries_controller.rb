class GalleriesController < ApplicationController
  OPENSEA_ASSET_URL = "https://api.opensea.io/api/v1/assets?format=json&limit=30&offset=0&order_direction=desc&owner=0x96ff1d6b5e9ca15f9e61b7e2130599005144fb28"

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

  def edit
    @gallery = Gallery.find(params[:id])
    opensea_pull
    @nfts_added = Nft.where(user: current_user).where(gallery: @gallery)
    @nfts_available = current_user.nfts.where(gallery: nil)
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
    params.require(:gallery).permit(:name)
  end

  def opensea_pull
    url = URI(OPENSEA_ASSET_URL)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::get(url)
    response = JSON.parse(request)
    response['assets'].each do |asset|
      if Nft.where(user: current_user).where(opensea_id: asset['id']).empty?
        nft = Nft.create(
          opensea_id: asset['id'],
          token_name: asset['name'],
          token_description: asset['description'],
          collection_name: asset.dig('collection', 'name'),
          collection_description: asset.dig('collection', 'description'),
          artist_name: asset.dig('creator', 'user', 'username') || asset.dig('collection', 'name'),
          image_url: asset['image_original_url'] || asset['image_url'],
          animation_url: asset['animation_original_url'],
          current_owner: asset.dig('owner', 'address'),
          token_metadata: asset,
          image_url_small: asset['image_preview_url'],
          opensea_link: asset['permalink'],
          user: current_user
        )
        nft.save
      else
        nft = Nft.find_by(user: current_user, opensea_id: asset['id'])
        nft.update(current_owner: asset.dig('owner', 'address'), token_metadata: asset)
      end
    end
  end
end
