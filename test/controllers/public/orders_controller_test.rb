require 'test_helper'

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get public_orders_input_url
    assert_response :success
  end

  test "should get confirm" do
    get public_orders_confirm_url
    assert_response :success
  end

  test "should get create" do
    get public_orders_create_url
    assert_response :success
  end

  test "should get thanks" do
    get public_orders_thanks_url
    assert_response :success
  end

end
