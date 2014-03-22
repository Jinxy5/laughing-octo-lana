json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :email, :password_digest, :nick_name
  json.url user_url(user, format: :json)
end
