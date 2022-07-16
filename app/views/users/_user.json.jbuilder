json.extract! user, :id, :name, :bio, :photo, :posts_counter, :created_at, :updated_at
json.url user_url(user, format: :json)
