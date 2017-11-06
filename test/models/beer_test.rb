require 'test_helper'

class BeerTest < ActiveSupport::TestCase

  test "should have name" do
    beer = Beer.new(brewery: "Stone", name: "", style: "IPA", date: Time.now, rating: "5", cellar_date: Time.now, description: "Lorem ipsum soler blah blah", user_id: 1)
    assert_not beer.valid?
  end
    
  test "should have brewery" do
    beer = Beer.new(brewery: "", name: "IPA", style: "IPA", date: Time.now, rating: "5", cellar_date: Time.now, description: "Lorem ipsum soler blah blah", user_id: 1)
    assert_not beer.valid?
  end
    
  test "should have style" do
    beer = Beer.new(brewery: "Stone", name: "IPA", style: "", date: Time.now, rating: "5", cellar_date: Time.now, description: "Lorem ipsum soler blah blah", user_id: 1)
    assert_not beer.valid?
  end
    
  test "should have date" do
    beer = Beer.new(brewery: "Stone", name: "IPA", style: "IPA", date: "", rating: "5", cellar_date: Time.now, description: "Lorem ipsum soler blah blah", user_id: 1)
    assert_not beer.valid?
  end
    
  test "should have rating between 0 and 5" do
    beer = Beer.new(brewery: "Stone", name: "IPA", style: "IPA", date: Time.now, rating: "6", cellar_date: Time.now, description: "Lorem ipsum soler blah blah", user_id: 1)
    assert_not beer.valid?
  end
    
  test "should have description" do
    beer = Beer.new(brewery: "Stone", name: "IPA", style: "IPA", date: Time.now, rating: "6", cellar_date: Time.now, description: "", user_id: 1)
    assert_not beer.valid?
  end
    
  test "should validate cellar date" do
    beer = Beer.new(brewery: "Stone", name: "IPA", style: "IPA", date: Time.now, rating: "6", cellar_date: "", description: "Lorem ipsum soler blah blah", user_id: 1)
    assert_not beer.valid?
  end
    
end
