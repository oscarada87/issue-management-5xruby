json.extract! user, :id, :account, :encrypted_password, :name, :created_at, :updated_at
json.url user_url(user, format: :json)
