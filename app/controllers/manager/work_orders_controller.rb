class Manager::WorkOrdersController < ApplicationController
  before_action :set_work_order, only: %i[show edit update destroy]

  def index
    @team_leaders = TeamLeader.all
    @work_orders_full = WorkOrder.all
    @work_orders = @work_orders_full

    @work_orders = WorkOrder.where("name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    @work_orders = @work_orders.where(team_leader_id: params[:team]) if params[:team].present?
    @work_orders = @work_orders.where(priority: params[:priority]) if params[:priority].present?
    @work_orders = @work_orders.where(status: params[:status]) if params[:status].present?
    @work_orders = @work_orders.where(due_date: params[:due_date]) if params[:due_date].present?

    @events = WorkOrder.where.not(due_date: nil).map { |w| { title: w.name, start: w.due_date } }
  end

  def new
    @work_order = WorkOrder.new
  end

  def show
    @marker = {
      lat: @work_order.latitude,
      lng: @work_order.longitude,
      image_url: helpers.asset_url('shovel_marcador.png'),
      infoWindow: render_to_string(partial: "info_window", locals: { work_order: @work_order })
    }


    # @work_order.tasks.pluck(:done)
    # @chart = WorkOrder.group(:done).count
    # @chart.keys.each do |key|
    #   @chart[['Aberto', 'Em andamento', 'Concluído'][key - 1]] = @chart.delete key
    # end
  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    # raise
    if @work_order.save
      redirect_to manager_dashboard_index_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @work_order.update(work_order_params)
    redirect_to manager_work_orders_path
  end

  def destroy
    @work_order.destroy
    redirect_to manager_dashboard_index_path
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
                                        :status,
                                        :report,
                                        tasks_attributes: [:id, :description, :done, :_destroy])

  end

end
