require "test_helper"

class UpvoteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upvote_index_url
    assert_response :success
  end

  test "should get create" do
    get upvote_create_url
    assert_response :success
  end

  test "should get delete" do
    get upvote_delete_url
    assert_response :success
  end
end
