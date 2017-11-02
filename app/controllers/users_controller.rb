class UsersController < ApplicationController
    
  def create
      @user = User.create(user_params)
      if @user.save
         render 'new' 
      end
  end
    
  def show
    @user = User.find(params[:id]) 
  end
    
  private
    
  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end
    
end
