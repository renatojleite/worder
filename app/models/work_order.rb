class WorkOrder < ApplicationRecord
  # enum status: { Aberta: 0, 'Em andamento': 1, Concluido: 2 }
  belongs_to :team_leader
  geocoded_by :address
  mount_uploader :photo, PhotoUploader
  after_validation :geocode, if: :will_save_change_to_address?
end
