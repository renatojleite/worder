require 'test_helper'

class Manager::TeamLeadersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_team_leaders_index_url
    assert_response :success
  end

  test "should get new" do
    get manager_team_leaders_new_url
    assert_response :success
  end

  test "should get create" do
    get manager_team_leaders_create_url
    assert_response :success
  end

  test "should get show" do
    get manager_team_leaders_show_url
    assert_response :success
  end

  test "should get edit" do
    get manager_team_leaders_edit_url
    assert_response :success
  end

  test "should get update" do
    get manager_team_leaders_update_url
    assert_response :success
  end

  test "should get delete" do
    get manager_team_leaders_delete_url
    assert_response :success
  end

end
