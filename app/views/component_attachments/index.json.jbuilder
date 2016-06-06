json.array!(@component_attachments) do |component_attachment|
  json.extract! component_attachment, :id, :attachment, :component_id
  json.url component_attachment_url(component_attachment, format: :json)
end
