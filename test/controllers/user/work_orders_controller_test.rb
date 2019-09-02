require 'test_helper'

class User::WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_work_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get user_work_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get user_work_orders_update_url
    assert_response :success
  end

end
