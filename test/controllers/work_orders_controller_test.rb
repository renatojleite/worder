require 'test_helper'

class WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get work_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get work_orders_update_url
    assert_response :success
  end

end
