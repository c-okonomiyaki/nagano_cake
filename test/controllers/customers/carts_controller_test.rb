require "test_helper"

class Customers::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_carts_index_url
    assert_response :success
  end
end
