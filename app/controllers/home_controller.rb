class HomeController < ApplicationController
  def index
  	if current_user
  		@user = current_user
  		@place = Place.new
  		@places = Place.all
  		@review = Review.new
  	else
  		redirect_to log_in_path
  	end
  end

  def _bigShow
    @place = Place.find(params[:id])
    @x = :id
    # respond_to do |format|
    #   format.js
    # end

  end
end
