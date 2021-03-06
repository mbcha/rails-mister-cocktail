class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      flash[:reviews_error] = @review.error
      redirect_to @cocktail
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :stars, :cocktail_id)
  end
end
