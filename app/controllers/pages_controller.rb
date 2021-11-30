class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @gallery = Gallery.where(user: current_user)
  end

  def aboutus
  end
end
