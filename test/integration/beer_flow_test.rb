require 'test_helper'

class BeerFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
     @user = users(:john) 
     @beer = beers(:miller)
  end
  
  test "should add and delete beer" do
    sign_in @user 
    assert_difference '@user.beers.count', 1 do
      post beers_path, params: { beer: { brewery: "Stone", name: "IPA", style: "IPA", date: Time.now, rating: "4", cellar_date: Time.now, description: "lorem ipsum", user_id: 1 } }
    end
    assert_difference '@user.beers.count', -1 do
      delete beer_path(id: @beer.id)
    end
  end
    
end
