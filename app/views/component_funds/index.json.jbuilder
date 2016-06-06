json.array!(@component_funds) do |component_fund|
  json.extract! component_fund, :id, :source, :amount, :component_id
  json.url component_fund_url(component_fund, format: :json)
end
