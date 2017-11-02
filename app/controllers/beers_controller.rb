class BeersController < ApplicationController
    
  def index
    @beers = current_user.beers
  end
    
  def new
     @beer = Beer.new 
  end

  def create
    @beer = current_user.beers.create(beer_params)
    if @beer.save
      flash[:success] = "Another beer down sir!"
      redirect_to user_path(current_user)
    end
  end

  def show
  end

  def destroy
  end
    
  private
    
  def beer_params
    params.require(:beer).permit(:name, :rating)  
  end
    
end
