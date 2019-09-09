class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: %i[show edit update]
  # def index
  #   @work_orders = WorkOrder.all
  # end

  def index
    user = TeamLeader.find_by(user: current_user)
    @work_orders = WorkOrder.where(team_leader: user)
  end

  def new
    @work_order = WorkOrder.new
  end

  def show
    @marker = { lat: @work_order.latitude, lng: @work_order.longitude, image_url: helpers.asset_url('shovel_marcador.png') }
  end

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end

  def edit
  end

  def update
    @work_order.update(work_order_params)
    flash[:alert] = "Atualizado com sucesso"
    redirect_to work_orders_path(@work_order)

  end

  private

  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end

  def work_order_params
    params.require(:work_order).permit(:priority, :address, :due_time, :due_date, :description, :completion_date, :start_photo, :end_photo, :team_leader_id, :report, :status, :photo, tasks_attributes: [:id, :description, :done])
  end
end
