json.array!(@project_funds) do |project_fund|
  json.extract! project_fund, :id, :source, :amount, :references
  json.url project_fund_url(project_fund, format: :json)
end
