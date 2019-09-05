class Manager::DashboardController < ApplicationController
  def index
    # WORK ORDERS - Filtros + Show all for index
    @work_orders_full = WorkOrder.all
    @work_orders = @work_orders_full

    @work_orders = WorkOrder.where("name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    @work_orders = WorkOrder.where(team_leader_id: params[:team]) if params[:team].present?
    @work_orders = WorkOrder.where(priority: params[:priority]) if params[:priority].present?
    @work_orders = WorkOrder.where(status: params[:status]) if params[:status].present?
    @work_orders = WorkOrder.where(due_date: params[:due_date]) if params[:due_date].present?

    # WORK ORDERS - Calendario
    @events = WorkOrder.where.not(due_date: nil).map { |w| { title: w.name, start: w.due_date } }

    # TEAM - Filtros + Show all for index
    if params[:query].present?
      @team_leaders = TeamLeader.where("team_name ILIKE ?", "%#{params[:query]}%")
    else
      @team_leaders = TeamLeader.all
    end

  end
end
