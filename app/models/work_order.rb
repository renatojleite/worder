class WorkOrder < ApplicationRecord
  belongs_to :team_leader
  belongs_to :status
end
