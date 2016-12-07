require 'test_helper'

class UnpopularVideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get unpopular_videos_index_url
    assert_response :success
  end

end
