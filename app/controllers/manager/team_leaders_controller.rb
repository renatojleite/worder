class Manager::TeamLeadersController < ApplicationController

  def index
    @team_leaders = TeamLeader.all? { |e|  }
  end

  def new
    @team_leader = TeamLeader.new
  end

  def create
    @team_leader = TeamLeader.new(team_leader_params)
    @team_leader.user = current_user
    if @team_leader.save
      redirect_to user_team_leaders_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_work_order
    @team_leader = TeamLeader.find(params[:id])
  end

  def work_order_params
    params.require(:team_leader).permit(:team_name, :user_id, :manager_id)
  end
end
