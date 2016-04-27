json.array!(@funds) do |fund|
  json.extract! fund, :id, :description
  json.url fund_url(fund, format: :json)
end
