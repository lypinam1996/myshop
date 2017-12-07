json.extract! product, :id, :title, :price, :author, :count, :pages, :created_at, :updated_at
json.url product_url(product, format: :json)
