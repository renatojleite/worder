class Manager::TeamLeadersController < ApplicationController
  before_action :set_team_leader, only: %i[show edit update delete]

  def index
    @team_leaders = TeamLeader.all
  end

  def new
    @team_leader = TeamLeader.new

  end

  def create
    # passar ID do manager?
    # mostrar lista de usuários para selecionar um e atribuir ao Team.
    # Não está salvando novo TEAM

    @team_leader = TeamLeader.new(team_leader_params)
    @team_leader.manager = current_user.manager
    if @team_leader.save
      redirect_to manager_team_leaders_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @team_leader.update(team_leader_params)
    redirect_to manager_team_leaders_path
  end

  def destroy
    @team_leader.destroy
    redirect_to team_leaders_path
  end

  private

  def set_team_leader
    @team_leader = TeamLeader.find(params[:id])
  end

  def team_leader_params
    params.require(:team_leader).permit(:team_name, :user_id, :manager_id)
  end
end
