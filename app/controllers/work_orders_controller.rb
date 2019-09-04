class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: %i[show update]
  # def index
  #   @work_orders = WorkOrder.all
  # end

  def index
    user = TeamLeader.find_by(user: current_user)
    @work_orders = WorkOrder.where(team_leader: user)
  end

  def show
  end

  def update
    @work_order.update(work_order_params)
    redirect_to work_order_path(@work_order)
  end

  private

  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end

  def work_order_params
    params.require(:work_order).permit(:priority, :address, :due_time, :due_date, :description, :completion_date, :start_photo, :end_photo, :team_leader_id, :status_id)
  end
end
