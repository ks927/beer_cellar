class StaticPagesController < ApplicationController
  def home
    @user = current_user
  end

  def contact
  end

  def about
  end
end
