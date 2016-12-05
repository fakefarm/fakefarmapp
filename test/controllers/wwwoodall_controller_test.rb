require 'test_helper'

class WwwoodallControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wwwoodall_index_url
    assert_response :success
  end

end
