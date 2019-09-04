class TeamLeader < ApplicationRecord
  belongs_to :user
  belongs_to :manager
  has_many :work_orders

  def get_team_name
    "#{team_name}"
  end

end
