require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
    test "should have name" do
      user = User.new(name: "", email: "example@beer.com", password: "foobar")
      assert_not user.valid?
    end
    
end
