json.array!(@products) do |product|
  json.extract! product, :id, :name, :decription, :image_url, :brand_new, :price
  json.url product_url(product, format: :json)
end
