json.array!(@bids) do |bid|
  json.extract! bid, :id, :description
  json.url bid_url(bid, format: :json)
end
