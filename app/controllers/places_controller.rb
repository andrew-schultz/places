class PlacesController < ApplicationController
  def index
  	@posts = Place.all
  end

  def new
  	@place = Place.new
  end

  def create
  	@place = Place.new(place_params)
  	if @place.save
  		redirect_to root_path
  	else
  		redirect_to back
  		flash[:notice] = "There was an issue creating your place"
  	end
  end

  def edit
  	@place = Place.find(params[:id])
  end

  def update
  	@place = Place.find(params[:id])
  	@place.update(place_params)
  	@place.save
  	redirect_to @place
  end

  def _new
  	@place = Place.new
  	@user = current_user
  	@review = Review.new
  end

  def _bigShow
    @user = current_user
    @places = Place.all
    @place = Place.find(params[:id])
    
    respond_to do |format|
      format.js
    end

  end

  def big_show
    respond_to do |format|
      format.js
    end
  end

  def show
  	@user = current_user
  	@place = Place.find(params[:id])
    @places = Place.all
    @reviews = @place.reviews
  end

  def destroy
  	@user = current_user
  	@place = Place.find(params[:id])
  	if @user.id == @place.user_id
  		@place.destroy
  		redirect_to root_path
  	else
  		flash[:notice] = "You can't delete someone else's place"
   		redirect_to back
   	end
  end


  private

  def place_params
  	params.require(:place).permit(:name, :latitude, :longitude, :address, :zip, :user_id)
  end

  def review_params
  	params.require(:review).permit(:user_id, :place_id, :review, :score)
  end
end
