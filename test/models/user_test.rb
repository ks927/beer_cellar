require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should have name" do
    user = User.new(name: "", email: "example@beer.com", password: "foobar")
    assert_not user.valid?
  end
    
  test "should follow and unfollow a user" do
    mike = users(:mike)
    john = users(:john)
    assert_not mike.following?(john)
    mike.follow(john)
    assert mike.following?(john)
    assert john.followers.include?(mike)
    mike.unfollow(john)
    assert_not mike.following?(john)
  end
    
end
