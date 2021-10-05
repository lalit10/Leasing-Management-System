class Application < ApplicationRecord
  belongs_to :property , optional: true
  belongs_to :applicant
end
