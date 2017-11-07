class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def index
     @users = User.all 
  end
    
  def create
      @user = User.create(user_params)
      if @user.save
         render 'new' 
      end
  end
    
  def show
    @user = User.find(params[:id]) 
    @beer = current_user.beers.build
  end
    
  def following
      
  end
    
  def followers
      
  end
    
  private
    
  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end
    
end
