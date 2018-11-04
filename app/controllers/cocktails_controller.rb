class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.where(name: params[:name])
    @results = search
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
    if @review.stars
      @rating = total_stars
    end
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

  def search
    Cocktail.where(name: params[:name])
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
    rating / reviews.count
  end
end
