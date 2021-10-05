class Property < ApplicationRecord
  has_many :applications
  has_many :applicants, through: :applications, dependent: :destroy
  belongs_to :leasing_agent, optional: true
  validates :name, :address, :size, :terms_available, :earliest_start_time, :application_fee, :monthly_rent, :occupied_by, presence: true
end




