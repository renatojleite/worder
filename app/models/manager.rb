class Manager < ApplicationRecord
  belongs_to :user
  has_many :team_leaders
end
