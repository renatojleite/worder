class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.manager.nil?
      work_orders_path
    else
      manager_dashboard_index_path
    end
  end

end

