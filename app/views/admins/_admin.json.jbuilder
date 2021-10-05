json.extract! admin, :id, :admin_id, :name, :password, :email_address, :phone_number, :created_at, :updated_at
json.url admin_url(admin, format: :json)
