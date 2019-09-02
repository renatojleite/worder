require 'test_helper'

class Manager::WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_work_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get manager_work_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get manager_work_orders_create_url
    assert_response :success
  end

  test "should get show" do
    get manager_work_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get manager_work_orders_edit_url
    assert_response :success
  end

  test "should get update" do
    get manager_work_orders_update_url
    assert_response :success
  end

  test "should get delete" do
    get manager_work_orders_delete_url
    assert_response :success
  end

end
