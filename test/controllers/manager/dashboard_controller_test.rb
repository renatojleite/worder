require 'test_helper'

class Manager::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_dashboard_index_url
    assert_response :success
  end

end
