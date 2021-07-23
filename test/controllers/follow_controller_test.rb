require "test_helper"

class FollowControllerTest < ActionDispatch::IntegrationTest
  test "should get follower_id:integer" do
    get follow_follower_id:integer_url
    assert_response :success
  end

  test "should get followee_id:integer" do
    get follow_followee_id:integer_url
    assert_response :success
  end
end
