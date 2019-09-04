class WorkOrder < ApplicationRecord
  belongs_to :team_leader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
