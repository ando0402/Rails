json.extract! user, :id, :name, :password, :email, :portrait, :created_at, :updated_at
json.url user_url(user, format: :json)
json.portrait url_for(user.portrait)
