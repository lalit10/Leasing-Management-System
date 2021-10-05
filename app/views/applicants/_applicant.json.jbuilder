json.extract! applicant, :id, :applicant_id, :name, :password, :email_address, :phone_number, :property_applied, :property_occupied, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
