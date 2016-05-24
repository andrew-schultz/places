class ReviewsController < ApplicationController
  def new
    @user = current_user
    @place = Place.find(params[:id])
    @review = Review.new
  end

  def _new
    @user = current_user
    @place = Place.find(params[:id])
    @review = Review.new
  end

  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.create(review_params)
    redirect_to place_path(@place)
  end

  def edit
    @review = Review.find(params[:id])

  end

  def update
  end

  def destroy
  end

  private

  def review_params
  	params.require(:review).permit(:user_id, :place_id, :review, :score)
  end
  
end
