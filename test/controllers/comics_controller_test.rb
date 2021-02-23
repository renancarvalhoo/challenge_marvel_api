require "test_helper"

class ComicsControllerTest < ActionDispatch::IntegrationTest
  test "comics index" do
    Time.stub :now, Time.zone.parse("2021-02-23 13:11:56 UTC") do
      VCR.use_cassette("comics_controller") do
        get comics_url
        assert_response :success

        assert_not_nil assigns(:page)
        assert_not_nil assigns(:total_pages)
        assert_not_nil assigns(:favorites)
        assert_not_nil assigns(:comics)
      end
    end
  end
end
