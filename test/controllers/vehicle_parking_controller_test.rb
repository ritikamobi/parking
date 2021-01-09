require 'test_helper'

class VehicleParkingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vehicle_parking_index_url
    assert_response :success
  end

  test "should get edit" do
    get vehicle_parking_edit_url
    assert_response :success
  end

end
