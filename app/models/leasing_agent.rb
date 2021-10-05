class LeasingAgent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :properties
  validates :name, :email, :phone_number, presence: true
  validates :password, presence: true, :if =>:password


end
