require 'test_helper'

class ParkingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parking_index_url
    assert_response :success
  end

  test "should get create" do
    get parking_create_url
    assert_response :success
  end

  test "should get destroy" do
    get parking_destroy_url
    assert_response :success
  end

end
