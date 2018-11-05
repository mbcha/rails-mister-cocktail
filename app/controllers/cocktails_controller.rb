class CocktailsController < ApplicationController
  def index
    if params[:result]
      @ingredient = Ingredient.where(name: params[:result])
      if @ingredient.empty?
        @cocktails = Cocktail.where(name: params[:result])
      else
        @cocktails = Cocktail.joins(:doses).where(doses: { ingredient_id: @ingredient })
      end
      # redirect_to result_cocktails_path(params[:name])
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @rating = total_stars
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.photo_url.nil?
      @cocktail.photo = "https://images.unsplash.com/photo-1496134732667-ae8d2853a045?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e4dd1c9106a69065ccfa21a36cfb53b1&auto=format&fit=crop&w=1350&q=80";
    end
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def result
    @ingredient = Ingredient.where(name: params[:result])
    @cocktails = Cocktail.where(name: params[:result]).or(Cocktail.where(ingredient: params[:result]))

  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

  def total_stars
    rating = 0
    reviews = Review.where(cocktail_id: @cocktail.id)
    reviews.each do |review|
      rating += review.stars
    end
    rating /= reviews.count if rating.positive?
    rating
  end
end
