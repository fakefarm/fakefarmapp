require 'test_helper'
require 'social_network_service'

class SocialNetworkServiceTest < ActiveSupport::TestCase
  test "get all social networks" do
    s = SocialNetworkService.new.all
    assert_equal 6, s.count 
  end
end
