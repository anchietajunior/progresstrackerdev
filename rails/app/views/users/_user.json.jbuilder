json.extract! user, :id, :name, :email, :passwor_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
