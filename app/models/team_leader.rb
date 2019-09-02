class TeamLeader < ApplicationRecord
  belongs_to :user
  belongs_to :manager
  has_many :work_orders
end
