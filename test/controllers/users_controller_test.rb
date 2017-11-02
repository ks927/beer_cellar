require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    
  def setup
     @user = users(:john) 
  end
    
  test "should get user show page" do
    get user_path(@user.id)
    assert_response :success
  end

end
