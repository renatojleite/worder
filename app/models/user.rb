class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # scope :admin => { where(admin: false) }''

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :manager

end
