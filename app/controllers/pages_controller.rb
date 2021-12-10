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
    nunoimg = "https://res.cloudinary.com/jansommer/image/upload/v1638886031/nftease/image_lzl0s8.png"
    nunodesc = ""
    aleximg = "https://res.cloudinary.com/jansommer/image/upload/v1638886253/nftease/Image_from_iOS_x7swvk.jpg"
    alexdesc = ""
    phillipimg = "https://res.cloudinary.com/jansommer/image/upload/v1638890141/nftease/unnamed-1_e4isvx.png"
    phillipdesc = ""
    flynnimg = "https://res.cloudinary.com/jansommer/image/upload/v1638886200/nftease/unnamed_hwlhxu.png"
    flynndesc = ""
    alex = { name: "Alex Bradford Paul", image: aleximg, desc: alexdesc, position: "CEO" }
    phillip = { name: "Jan Phillip Sommerfeld", image: phillipimg, desc: phillipdesc, position: "CTO" }
    nuno = { name: "Nuno Dantas da Costa", image: nunoimg, desc: nunodesc, position: "CCO" }
    flynn = { name: "Flynn Washington", image: flynnimg, desc: flynndesc, position: "CDO" }
    @nfteam = [alex, phillip, nuno, flynn]
  end
end
