class WorkOrdersController < ApplicationController

  def index
    @work_orders = WorkOrder.all
  end

  def show
  end

  def update
  end
end
