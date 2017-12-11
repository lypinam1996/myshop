json.extract! production, :id, :title, :price, :author_id, :count, :pages, :created_at, :updated_at
json.url production_url(production, format: :json)
