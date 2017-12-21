json.extract! cart, :id, :production_id, :user_id, :count, :sum, :created_at, :updated_at
json.url cart_url(cart, format: :json)
