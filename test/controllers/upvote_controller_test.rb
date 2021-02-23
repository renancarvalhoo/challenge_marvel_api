require "test_helper"

class UpvoteControllerTest < ActionDispatch::IntegrationTest



  test "upvote create" do
    open_session do
      assert_difference('Upvote.count') do
        post upvotes_url, params: { comic_id: 1, session_id: "session_id" }
      end
      assert_redirected_to root_url
    end
  end

  test "upvote delete" do
    Upvote.create(session_id: "session_id", comic_id: 2 )
    delete upvote_url(2), params: { session_id: "session_id" }
    favorite = Upvote.find_by(session_id: "session_id", comic_id: 2 )
    assert_nil favorite
    assert_redirected_to root_url
  end
end
