require 'test_helper'

class ClosetStationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get closet_stations_new_url
    assert_response :success
  end

end
