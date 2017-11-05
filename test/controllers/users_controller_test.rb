require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    
  def setup
     @user = users(:john) 
  end
    
  test "should redirect if not logged in" do
    get user_path(@user.id)
    assert_redirected_to '/users/sign_in'
  end

end
