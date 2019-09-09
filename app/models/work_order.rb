class WorkOrder < ApplicationRecord
  # enum status: { Aberta: 0, 'Em andamento': 1, Concluido: 2 }
  belongs_to :team_leader
  has_many :tasks, inverse_of: :work_order
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  geocoded_by :address
  validates :name, uniqueness: true
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader


end
