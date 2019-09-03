class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.manager.nil?
      redirect_to work_orders_path
    else
      redirect_to manager_work_orders_path
    end
  end
end
