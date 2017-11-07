class BeersController < ApplicationController
    
  def index
    @user = User.find_by(id: params[:user_id])
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
    
  def edit
    @beer = Beer.find(params[:id]) 
  end
    
  def update
    @beer = Beer.find(params[:id])
    if @beer.update_attributes(beer_params)
      flash[:notice] = "Beer updated!" 
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    beer = Beer.find(params[:id])
    beer.destroy
    respond_to do |format|
       format.js
       format.html { redirect_to request.referrer || root_url }
    end
  end
    
  private
    
  def beer_params
    params.require(:beer).permit(:name, :rating, :style, :brewery, :date, :description, :cellar_date)  
  end
    
end
