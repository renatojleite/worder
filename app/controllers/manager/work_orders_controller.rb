class Manager::WorkOrdersController < ApplicationController
  before_action :set_work_order, only: %i[show edit update delete]

  def index
    @work_orders = WorkOrder.all
  end

  def new
    @work_order = WorkOrder.new
  end

  def show
    # @work_order = WorkOrder.geocoded

    @markers = {lat: @work_order.latitude, lng: @work_order.longitude}

  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    if @work_order.save
      redirect_to manager_work_orders_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @work_order.update(work_order_params)
    redirect_to work_order_path(@work_order)
  end

  def destroy
    @work_order.destroy
    redirect_to work_orders_path
  end

  private

  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end

  def work_order_params
    params.require(:work_order).permit( :name,
                                        :priority,
                                        :address,
                                        :due_time,
                                        :due_date,
                                        :description,
                                        :completion_date,
                                        :start_photo,
                                        :end_photo,
                                        :team_leader_id,
                                        :status_id)
  end
end
