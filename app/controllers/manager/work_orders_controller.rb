class Manager::WorkOrdersController < ApplicationController

  before_action :set_work_order, only: [:show, :edit, :update, :delete]

  def index
    @work_orders = WorkOrder.all
  end

  def new
    @work_order = WorkOrder.new
  end

  def show
  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    @work_order.user = current_user
    if @work_order.save
      redirect_to user_work_orders_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end

  def work_order_params
    params.require(:work_order).permit(:priority, :address, :due_time, :due_date, :description, :completion_date, :start_photo, :end_photo, :team_leader_id, :status_id)
  end
end
