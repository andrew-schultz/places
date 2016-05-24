require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  test "should get follower_id:integer" do
    get :follower_id:integer
    assert_response :success
  end

  test "should get followed_id:integer" do
    get :followed_id:integer
    assert_response :success
  end

end
