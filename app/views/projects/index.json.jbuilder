json.array!(@projects) do |project|
  json.extract! project, :id, :title, :abc, :status, :bidding_status, :contractor, :progress, :tdc, :noa, :ntp, :adc, :cost, :university_id
  json.url project_url(project, format: :json)
end
