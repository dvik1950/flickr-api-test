class StaticPagesController < ApplicationController

  def home
     FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKRAW_API_KEY']
    id = '156633043@N07'
    id = search_params[:user_id] if search_params
    @pics = flickr.people.getPhotos(user_id: id, extras: "url_m")
  end

  def search_params
    params.require(:search).permit(:user_id) if params[:search]
  end

end
