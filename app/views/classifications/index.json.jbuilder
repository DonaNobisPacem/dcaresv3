json.array!(@classifications) do |classification|
  json.extract! classification, :id, :description
  json.url classification_url(classification, format: :json)
end
