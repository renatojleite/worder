class WorkOrder < ApplicationRecord
  # enum status: { Aberta: 0, 'Em andamento': 1, Concluido: 2 }
  belongs_to :team_leader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  def status_name(num)
    # names = { Aberta: 0, 'Em andamento': 1, Concluido: 2 }
    names = ['Aberta', 'Em andamento', 'Concluido']
    names[num+1]
  end
end
