require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
  
  test "sign up flow" do
    get root_url
    #click sign up
    get sign_up_url
    assert_response :success
    #redirect to registration page
    assert_select 'h2', text: 'Sign up'
    #enter info
    assert_difference 'User.count', 1 do
            post user_registration_path, params: { user: { name: "Example", email: "user@example.com", password: "password", password_confirmation: "password" } }
    end
    #redirect to user show page
    follow_redirect!
    assert_select 'a[href=?]', sign_out_url
  end
    
end
