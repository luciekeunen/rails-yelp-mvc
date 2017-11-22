class ReviewsController < ApplicationController

  # We don't need the new method anymore as we included it in the restaurants#show
  # I leave it here to please rake
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review[:restaurant_id] = params[:restaurant_id]
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      # render 'restaurants/show' ne fonctionne pas car ca redirige vers la vue
      # on aura perdu les variables définies dans la méthode show
      # Pour ne pas perdre les infos du formulaire, il faudra utiliser AJAX
      redirect_to restaurant_path(params[:restaurant_id])

      # To please rake, comment redirect_to above and uncomment render below
      # render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
