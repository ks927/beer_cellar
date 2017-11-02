require 'test_helper'

class SignOutTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
    @user = users(:john)
  end
    
  #test "should sign out successfully" do
    #sign_in @user
    #follow_redirect!
    #assert_select "a[href=?]", sign_out_path
  #end
    
end
