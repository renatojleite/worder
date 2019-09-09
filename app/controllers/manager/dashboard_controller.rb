class Manager::DashboardController < ApplicationController


  def index
    # WORK ORDERS - Filtros + Show all for index
    @work_orders_full = WorkOrder.all
    @work_orders = @work_orders_full

    @work_orders = WorkOrder.where("name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    @work_orders =  @work_orders.where(team_leader_id: params[:team]) if params[:team].present?
    @work_orders =  @work_orders.where(priority: params[:priority]) if params[:priority].present?
    @work_orders =  @work_orders.where(status: params[:status]) if params[:status].present?
    @work_orders =  @work_orders.where(due_date: params[:due_date]) if params[:due_date].present?

    # WORK ORDERS - Calendario
    @events = WorkOrder.where.not(due_date: nil).map { |w| { title: w.name, start: w.due_date } }

    # TEAM - Filtros + Show all for index
    if params[:query].present?
      @team_leaders = TeamLeader.where("team_name ILIKE ?", "%#{params[:query]}%")
    else
      @team_leaders = TeamLeader.all
    end

    # # MAP
    @markers = @work_orders_full.map do |order|
      {
        lat: order.latitude,
        lng: order.longitude,
        image_url: helpers.asset_url('shovel_marcador.png')
      }
    end

    @chart = WorkOrder.group(:status).count
    @chart.keys.each do |key|
      @chart[['Aberto', 'Em andamento', 'Concluído'][key - 1]] = @chart.delete key
    end
  end
end
