require "test_helper"

class Customers::DiliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_diliveries_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_diliveries_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_diliveries_edit_url
    assert_response :success
  end
end
