json.array!(@components) do |component|
  json.extract! component, :id, :project_id, :title, :abc, :status, :classification, :bidding_status, :contractor, :progress, :tdc, :noa, :ntp, :adc, :cost, :remarks
  json.url component_url(component, format: :json)
end
