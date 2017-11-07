require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  def setup
     @relationship = Relationship.new(follower_id: users(:john).id, followed_id: users(:mike).id) 
  end
    
  test "relationship shoudl be valid" do
    assert @relationship.valid?  
  end
    
end
